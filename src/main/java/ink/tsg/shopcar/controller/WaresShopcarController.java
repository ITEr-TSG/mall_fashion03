package ink.tsg.shopcar.controller;


import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.WaresRemark.beans.WaresRemark;
import ink.tsg.WaresRemark.service.WaresRemarkService;
import ink.tsg.shopcar.beans.WaresShopcar;
import ink.tsg.shopcar.service.WaresShopcarService;
import ink.tsg.untils.Msg;
import ink.tsg.wares.beans.Wares;
import ink.tsg.wares.service.WaresService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-10-31
 */
@Controller
@RequestMapping("/waresShopcar")
public class WaresShopcarController {
	
	@Autowired
	private WaresShopcarService wsService;
	
	@Autowired
	private WaresService wService;
	
	@Autowired
	private WaresRemarkService wrService;
	/**
	 * 通过Id查询到商品条目的信息和图片路径以及订单的备注修改信息
	 * */
	@RequestMapping(value="/getWaresItemById",method=RequestMethod.GET)
	@ResponseBody
	public Msg getWaresItemById(@RequestParam("id")Integer id,@RequestParam("orderNum")String orderNum) {
		//查询商品条目的信息
		WaresShopcar waresItem = wsService.selectById(id);
		//得到商品的图片
		Wares imgPath = wService.selectById(waresItem.getWaresId());
		//得到订单的备注信息
		EntityWrapper<WaresRemark> wrapper = new EntityWrapper<>();
		wrapper.eq("order_id",orderNum);
		WaresRemark remark;
		try {
			remark = wrService.selectOne(wrapper);
			return Msg.success().add("waresItem",waresItem).add("imgPath",imgPath.getWaresImg()).add("remark",remark.getRemarkText());
		} catch (Exception e) {
			return Msg.success().add("waresItem",waresItem).add("imgPath",imgPath.getWaresImg());
		}
	}
	
	
	/**
	 * 删除购物车条目
	 * */
	@RequestMapping(value="/delShopCarItem",method=RequestMethod.GET)
	@ResponseBody
	public Msg delShopCarItem(@RequestParam("id")Integer shopCarId) {
		boolean b = wsService.deleteById(shopCarId);
		if(b) {
			return Msg.success().add("success", "删除成功！");
		}else {
			return Msg.fail().add("error", "删除失败！");
		}
	}
	
	/**
	 * 用户登录后查询购物车
	 * @return 
	 * */
	@RequestMapping(value="/getShopCarByCustId",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getShopCarByCustId(@RequestParam("page")Integer page,@RequestParam("limit")Integer limit,@RequestParam("id")Integer custId) {
		
		EntityWrapper<WaresShopcar> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", custId);
		wrapper.ne("car_state",-1);
		wrapper.orderBy("shop_car_id", false);
		Page<Map<String, Object>> selectPage = wsService.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code",0);
		resultMap.put("msg","购物车");
		resultMap.put("count",selectPage.getTotal());
		resultMap.put("data",selectPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 添加到购物车
	 * */
	@RequestMapping(value="/addShopCar",method=RequestMethod.POST)
	@ResponseBody
	public Msg addShopCar(WaresShopcar wShop) {
		//计算出小计
		BigDecimal waresPrice = wShop.getWaresPrice();
		Integer waresNum = wShop.getWaresNum();
		BigDecimal num = new BigDecimal(waresNum);
		wShop.setWaresTotal(waresPrice.multiply(num));
		wShop.setCarState(1);
		
		boolean b = wsService.insert(wShop);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
}

