package ink.tsg.contact.controller;


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

import ink.tsg.contact.beans.Contact;
import ink.tsg.contact.service.ContactService;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-06
 */
@Controller
@RequestMapping("/contact")
public class ContactController {

	@Autowired
	private ContactService cService;
	
	
	/**
	 *处理留言 
	 * */
	@RequestMapping(value="/delContactById",method=RequestMethod.GET)
	@ResponseBody
	public Msg delContactById(@RequestParam("id")Integer id) {
		boolean b = cService.deleteById(id);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}
	
	/**
	 * 得到所有的留言
	 * @return 
	 * */
	@RequestMapping(value="/getAllContact",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAllContact(@RequestParam("page")Integer page ,@RequestParam("limit")Integer limit) {
		EntityWrapper<Contact> wrapper = new EntityWrapper<>();
		wrapper.orderBy("contact_id",false);
		Page<Map<String, Object>> mapsPage = cService.selectMapsPage(new Page<>(page, limit), wrapper);
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code",0);
		resultMap.put("msg","订单中心");
		resultMap.put("count",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 添加留言
	 * */
	@RequestMapping(value="/addContact",method=RequestMethod.POST)
	@ResponseBody
	public Msg addContact(Contact contact) {
		boolean b = cService.insert(contact);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	
}

