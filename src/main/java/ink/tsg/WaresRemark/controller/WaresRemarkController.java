package ink.tsg.WaresRemark.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ink.tsg.WaresRemark.beans.WaresRemark;
import ink.tsg.WaresRemark.service.WaresRemarkService;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-03
 */
@Controller
@RequestMapping("/waresRemark")
public class WaresRemarkController {

	@Autowired
	private WaresRemarkService wrService;
	
	@RequestMapping(value="/addRemark",method=RequestMethod.POST)
	@ResponseBody
	public Msg addRemark(WaresRemark waresRemark) {
		boolean b = wrService.insert(waresRemark);
		if(b) {
			return Msg.success().add("msg","修改成功！");
		}else {
			return Msg.fail().add("msg","修改失败！");
		}
		
	}
	
	
}

