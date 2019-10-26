package ink.tsg.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.admin.beans.Admin;
import ink.tsg.admin.service.AdminService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-10-03
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	/**
	 * 退出登录
	 * */
	@RequestMapping(value = "/signOut",method=RequestMethod.GET)
	public String signOut(HttpSession session) {
		session.invalidate();
		return "/login";
	}
	
	
	/**
	 * 跳转到管理员登录界面
	 * */
	@RequestMapping(value = "/loginPage",method=RequestMethod.GET)
	public String toLoginPage() {
		return "login";
	}
	/**
	 * 登录
	 * */
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String login(Admin admin,HttpSession session) {
		EntityWrapper<Admin> wrapper = new EntityWrapper<Admin>();
		wrapper.eq("admin_name", admin.getAdminName()).and().eq("admin_password", admin.getAdminPassword());
		int selectCount = adminService.selectCount(wrapper);
		if(selectCount == 0) {
			session.setAttribute("error", "用户名或密码错误！");
			return "login";
		}else {
			session.setAttribute("adminName",admin.getAdminName());
			return "index";
		}
		
	}
	@RequestMapping(value = "/toIndex",method=RequestMethod.GET)
	public String toAdminIndex() {
		return "index";
	}
	
	
	
}

