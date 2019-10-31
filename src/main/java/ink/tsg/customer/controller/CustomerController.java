package ink.tsg.customer.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.customer.beans.Customer;
import ink.tsg.customer.service.CustomerService;
import ink.tsg.shopcar.beans.WaresShopcar;
import ink.tsg.shopcar.service.WaresShopcarService;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-10-02
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private WaresShopcarService wsService;
	
	/**
	 * 退出登录
	 * */
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/fashion_page/index.jsp";
	}
	
	/**
	 * 用户登录
	 * */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Customer cust,HttpServletRequest request) {
		EntityWrapper<Customer> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_name", cust.getCustName());
		try {
			Customer customer = customerService.selectOne(wrapper);
			//查询购物车里商品的数量
			EntityWrapper<WaresShopcar> wrapperShop = new EntityWrapper<>();
			wrapperShop.eq("cust_id", customer.getCustId());
			int carCount = wsService.selectCount(wrapperShop);
			if(customer == null) {//用户不存在
				request.getSession().setAttribute("error", "用户不存在！");
				return "redirect:/fashion_page/login.jsp";
			}else {
				if(customer.getCustPassword().equals(cust.getCustPassword())) { //密码正确
					request.getSession().setAttribute("custNick", customer.getCustNick());
					request.getSession().setAttribute("custId", customer.getCustId());
					request.getSession().setAttribute("carCount", carCount);
					return "redirect:/fashion_page/index.jsp";
				}else { ///密码错误
					request.getSession().setAttribute("error", "密码错误！");
					return "redirect:/fashion_page/login.jsp";
				}
			}
		} catch (Exception e) {
			return "redirect:/fashion_page/login.jsp";
		}
		
			
	}
	
	
	
	/**
	 * 统计客户
	 * */
	@RequestMapping(value="/staCusts",method=RequestMethod.GET)
	@ResponseBody
	public Msg stacusts() {
		EntityWrapper<Customer> wrapperMan = new EntityWrapper<>();
		wrapperMan.eq("cust_gender", 1);
		int countMan = customerService.selectCount(wrapperMan);
		
		EntityWrapper<Customer> wrapperWoman = new EntityWrapper<>();
		wrapperWoman.eq("cust_gender", 0);
		int countWoman = customerService.selectCount(wrapperWoman);
		
		EntityWrapper<Customer> wrapperAge19 = new EntityWrapper<>();
		wrapperAge19.between("cust_age", 0, 19);
		int countAge19 = customerService.selectCount(wrapperAge19);
		
		EntityWrapper<Customer> wrapperAge29 = new EntityWrapper<>();
		wrapperAge29.between("cust_age", 20, 29);
		int countAge29 = customerService.selectCount(wrapperAge29);
		
		EntityWrapper<Customer> wrapperAge59 = new EntityWrapper<>();
		wrapperAge59.between("cust_age", 30, 59);
		int countAge59 = customerService.selectCount(wrapperAge59);
		
		EntityWrapper<Customer> wrapperAge100 = new EntityWrapper<>();
		wrapperAge100.between("cust_age", 60, 100);
		int countAge100 = customerService.selectCount(wrapperAge100);
		
		return Msg.success().add("countMan", countMan).add("countWoman", countWoman)
				.add("age19", countAge19).add("age29", countAge29).add("age59", countAge59).add("age100", countAge100);
	}
	
	/**
	 *  修改客户
	 * */
	@RequestMapping(value="/editCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg editCust(Customer customer) {
		System.out.println(customer);
		boolean updateById = customerService.updateById(customer);
		if(updateById) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}
	/**
	 * 得到所有客户
	 * */
	@RequestMapping(value="/getCusts",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getCusts(@RequestBody Map map) {
		//获取所有关键字
		List keydatas = (List) map.get("keydatas");
		//新建一个map存储关键字，用关键字的的name作为key
		Map<String,String> keys = new HashMap<String, String>();
		for (int i = 0; i < keydatas.size(); i++) {
			Map object2 = (Map) keydatas.get(i);
			String value = (String) object2.get("value");
			keys.put((String) object2.get("name"), value == ""?null:value);
		}

		int page = (int) map.get("page");
		int limit= (int) map.get("limit");
		
		EntityWrapper<Customer> wrapper = new EntityWrapper<>();
		if(keys.get("custName") != null) {
			wrapper.like("cust_name",(String) keys.get("custName"));
		}
		if(keys.get("custEmail") != null) {
			wrapper.like("cust_email",(String) keys.get("custEmail"));
		}
		if(keys.get("custGender") != null) {
			wrapper.eq("cust_gender", keys.get("custGender"));
		}
		if(keys.get("age_min") != null && keys.get("age_max")!=null) {
			wrapper.between("cust_age", keys.get("age_min"), keys.get("age_max"));
		}
		wrapper.orderBy("custId", false);
		Page<Map<String, Object>> selectPage = customerService.selectMapsPage(new Page<>(page,limit),wrapper);
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code",0);
		resultMap.put("msg","所有有效客户");
		resultMap.put("count",selectPage.getTotal());
		resultMap.put("data",selectPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 批量删除/单个删除传一个id即可
	 * */
	@RequestMapping(value="/delCusts",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCusts(@RequestBody List<Integer> custs) {
		try {
			boolean b = customerService.deleteBatchIds(custs);
			System.out.println(b);
			return Msg.success().add("msg", "删除成功！");
		} catch (Exception e) {
			return Msg.fail().add("msg", "删除失败！");
		}
	}
	
	/**
	 * 客户注册
	 * */
	@RequestMapping(value="/regiterCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg regiterCust(Customer customer) {
		
		if(customer.getCustAge() == null) {
			customer.setCustAge(0);
		}
		EntityWrapper<Customer> ew = new EntityWrapper<Customer>();
		ew.eq("cust_name", customer.getCustName())
		.orNew()
		.eq("cust_email",customer.getCustEmail());
		int count = customerService.selectCount(ew);
		if(count == 0) {
			boolean insert = customerService.insert(customer);
			if(insert) {
				return Msg.success();
			}else {
				return Msg.fail().add("fail", "注册失败！");
			}
		}else {
			return Msg.fail().add("fail", "邮箱或用户名已经被注册！");
		}
	}
	//====================页面跳转=========================
	/**
	 * 跳转到客户列表界面
	 * */
	@RequestMapping(value="/getAllCust",method=RequestMethod.GET)
	public String getAllCust() {
		return "customer/customers";
	}
	/**
	 * 跳转到添加客户界面
	 * */
	@RequestMapping(value="/addCust",method=RequestMethod.GET)
	public String addCust() {
		return "customer/addCust";
	}
	/**
	 * 跳转到统计客户界面
	 * */
	@RequestMapping(value="/statisticsCusts",method=RequestMethod.GET)
	public String statisticsCusts() {
		return "customer/stacusts";
	}
	
	
}

