package ink.tsg.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.admin.beans.Admin;
import ink.tsg.admin.service.AdminService;
import ink.tsg.untils.Msg;

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
	 * 修改密码
	 * */
	@RequestMapping(value="/changePWD",method=RequestMethod.POST)
	@ResponseBody
	public Msg changePWD(Admin admin) {
		EntityWrapper<Admin> wrapper = new EntityWrapper<>();
		wrapper.eq("admin_name", admin.getAdminName());
		wrapper.eq("admin_password", admin.getOldPassword());
		Admin one = adminService.selectOne(wrapper);
		if(one == null) {
			return Msg.fail().add("msg","旧密码错误！");
		}else {
			one.setAdminPassword(admin.getNewPassword());
			boolean b = adminService.updateById(one);
			if(b) {
				return Msg.success().add("msg","修改成功！请重新登录！");
			}else {
				return Msg.fail().add("msg","系统出错！");
			}
			
		}
		
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
	@RequestMapping(value = "/toChangePWD",method=RequestMethod.GET)
	public String toChangePWD() {
		return "changePWD";
	}
	
	
	
}

