package ink.tsg.order.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.order.beans.Order;
import ink.tsg.order.service.OrderService;
import ink.tsg.shopcar.beans.WaresShopcar;
import ink.tsg.shopcar.service.WaresShopcarService;
import ink.tsg.untils.Msg;

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
	
	
	/**
	 * 用户收货
	 * */
	@RequestMapping(value="/confirmOrder",method=RequestMethod.GET)
	@ResponseBody
	public Msg confirmOrder(@RequestParam("id")Integer orderId,@RequestParam("isShip")Integer isShip) {
		Order o = new Order();
		o.setOrderId(orderId);
		o.setIsShip(isShip);
		o.setOrderState("已收货");
		boolean b = oService.updateById(o);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}
	
	
	/**
	 * 前端订单中心
	 * */
	@RequestMapping(value="/getOrdersByCustId",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getOrdersByCustId(@RequestParam("page")Integer page,@RequestParam("limit")Integer limit,@RequestParam("id")Integer custId) {
		System.out.println(custId);
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		wrapper.eq("order_cust_id", custId);
		wrapper.orderBy("order_id", false);
		Page<Map<String, Object>> selectMapsPage = oService.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code",0);
		resultMap.put("msg","订单中心");
		resultMap.put("count",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 已发货 
	 * */
	@RequestMapping(value="/updateOrderState",method=RequestMethod.GET)
	@ResponseBody
	public Msg updateOrderState(@RequestParam("id")Integer orderId,@RequestParam("state")String orderState) {
		Order order = new Order();
		order.setOrderId(orderId);
		order.setOrderState(orderState);
		boolean b = oService.updateById(order);
		if(b) {
			return Msg.success().add("msg","已发货");
		}else {
			return Msg.fail().add("msg","发货失败！");
		}
		
	}
	
	/**
	 * 更新订单表的收货人信息
	 * */
	@RequestMapping(value="/updateConsigneeInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateConsigneeInfo(Order order) {
		boolean b = oService.updateById(order);
		if(b) {
			return Msg.success().add("msg","修改成功！");
		}else {
			return Msg.fail().add("msg","修改失败！");
		}
	}
	
	/**
	 * 得到所有的订单 （未收货的）
	 * @return 
	 * */
	@RequestMapping(value="/getAllOrders",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAllOrders(@RequestParam("page")Integer page,@RequestParam("limit")Integer limit,@RequestParam("orderNum")String orderNum) {
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		if(orderNum !="") {
			wrapper.eq("order_num", orderNum);
		}
		wrapper.eq("is_ship", -1);
		wrapper.ne("order_state","已收货");
		wrapper.orderBy("order_id");
		Page<Map<String, Object>> selectMapsPage = oService.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", 0);
		resultMap.put("msg", "已经收货的订单");
		resultMap.put("count", selectMapsPage.getTotal());
		resultMap.put("data", selectMapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有的订单 （已收货的）
	 * @return 
	 * */
	@RequestMapping(value="/getAllOrdersOfShip",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAllOrdersOfShip(@RequestParam("page")Integer page,@RequestParam("limit")Integer limit,@RequestParam("orderNum")String orderNum) {
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		if(orderNum !="") {
			wrapper.eq("order_num", orderNum);
		}
		wrapper.eq("is_ship", 1);
		wrapper.eq("order_state","已收货");
		wrapper.orderBy("order_id");
		Page<Map<String, Object>> selectMapsPage = oService.selectMapsPage(new Page<>(page, limit), wrapper);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", 0);
		resultMap.put("msg", "所有订单");
		resultMap.put("count", selectMapsPage.getTotal());
		resultMap.put("data", selectMapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 提交订单
	 * */
	@RequestMapping(value="/submitOrder",method=RequestMethod.POST)
	public String submitOrder(Order order,HttpServletRequest req) {
		long time = new Date().getTime();
		order.setOrderNum("FISHOIN"+time);
		order.setIsShip(-1);			//表示未发货
		order.setOrderState("已支付");
		WaresShopcar wShop  = new WaresShopcar();
		wShop.setCarState(-1);
		wShop.setShopCarId(order.getOrderCarId());
		boolean c = wsService.updateById(wShop);
		//boolean c = wsService.deleteById(order.getOrderCarId());
		boolean b = oService.insert(order);
		if(c&&b) {
			return "redirect:/fashion_page/wishlist.jsp";
		}else {
			req.getSession().setAttribute("error", "提交订单失败");
			return "redirect:/fashion_page/wishlist.jsp";
		}
		
	}
	//===========页面跳转===============
	@RequestMapping(value="/allOrders",method=RequestMethod.GET)
	public String toAdminOrderPage() {
		return "/order/orders";
	}
	@RequestMapping(value="/postSale",method=RequestMethod.GET)
	public String postSale() {
		return "/order/postSale";
	}
}
