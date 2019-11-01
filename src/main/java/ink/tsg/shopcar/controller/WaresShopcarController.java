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

import ink.tsg.shopcar.beans.WaresShopcar;
import ink.tsg.shopcar.service.WaresShopcarService;
import ink.tsg.untils.Msg;

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
	 * 登录后查询购物车
	 * @return 
	 * */
	@RequestMapping(value="/getShopCarByCustId",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getShopCarByCustId(@RequestParam("page")Integer page,@RequestParam("limit")Integer limit,@RequestParam("id")Integer custId) {
		
		EntityWrapper<WaresShopcar> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", custId);
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
		boolean b = wsService.insert(wShop);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
}

