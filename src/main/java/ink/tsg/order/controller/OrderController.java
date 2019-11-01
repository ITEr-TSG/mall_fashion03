package ink.tsg.order.controller;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ink.tsg.order.beans.Order;
import ink.tsg.order.service.OrderService;
import ink.tsg.shopcar.service.WaresShopcarService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-01
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private WaresShopcarService wsService;
	
	@RequestMapping(value="/submitOrder",method=RequestMethod.POST)
	public String submitOrder(Order order) {
		long time = new Date().getTime();
		order.setOrderNum("FISHOINPRESS"+time);
		order.setIsShip(-1);
		order.setOrderState("已支付");
		boolean c = wsService.deleteById(order.getOrderCarId());
		System.out.println(c);
		boolean b = oService.insert(order);
		System.out.println(b);
		return "redirect:/fashion_page/wishlist.jsp";
	}
}

