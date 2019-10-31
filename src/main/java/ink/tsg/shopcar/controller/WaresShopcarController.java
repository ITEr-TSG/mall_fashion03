package ink.tsg.shopcar.controller;


import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

