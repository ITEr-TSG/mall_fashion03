package ink.tsg.untils;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.contact.service.ContactService;
import ink.tsg.customer.service.CustomerService;
import ink.tsg.order.beans.Order;
import ink.tsg.order.service.OrderService;
import ink.tsg.shopcar.beans.WaresShopcar;
import ink.tsg.shopcar.service.WaresShopcarService;
import ink.tsg.wares.service.WaresService;

/**
 * 主页的数量统计
 * */
@Controller
@RequestMapping("/statisticsCount")
public class IndexStatisticsCount {
	
	@Autowired
	private WaresService waresService;
	
	@Autowired
	private CustomerService custService;
	
	@Autowired
	private WaresShopcarService wShopCarService;
	
	@Autowired
	private ContactService conService;
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * 后台头部的统计
	 * */
	@RequestMapping(value="/headerCount",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> headerCount() {
		int conCount = conService.selectCount(null);
		
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		wrapper.eq("is_ship",-1);
		wrapper.eq("order_state","已支付");
		int orderCount = orderService.selectCount(wrapper);
		Map<String, Object> map = new HashMap<>();
		map.put("conCount", conCount);
		map.put("orderCount", orderCount);
		return map;
	}
	
	/**
	 * 后台主页的统计
	 * */
	@RequestMapping(value="/indexCount",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> indexCount() {
		int waresCount = waresService.selectCount(null);
		int custCount = custService.selectCount(null);
		List<WaresShopcar> list = wShopCarService.selectList(null);
		BigDecimal b = new BigDecimal(0);
		for (WaresShopcar waresShopcar : list) {
			b = b.add(waresShopcar.getWaresTotal());
		}
		Map<String, Object> map = new HashMap<>();
		map.put("waresCount", waresCount);
		map.put("custCount", custCount);
		map.put("priceTotal", b);
		return map;
	}
	
	
	
	
}
