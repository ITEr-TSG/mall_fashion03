package ink.tsg.wares.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.untils.Msg;
import ink.tsg.wares.beans.Hotwares;
import ink.tsg.wares.beans.Wares;
import ink.tsg.wares.service.WaresService;
import ink.tsg.wares.service.impl.HotwaresServiceImpl;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
@Controller
@RequestMapping("/hotwares")
public class HotwaresController {

	
	@Autowired
	private WaresService wService;
	
	@Autowired
	private HotwaresServiceImpl hotwaresService;
	
	/**
	 * 删除属性
	 * */
	@RequestMapping(value="/delHot",method=RequestMethod.GET)
	public String delHot(@RequestParam("hotId") Integer hotId,HttpServletRequest request) {
		
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		wrapper.eq("wares_hot_id", hotId);
		int count = wService.selectCount(wrapper);
		if(count == 0) {
			boolean b = hotwaresService.deleteById(hotId);
			request.setAttribute("msgDelHot","删除成功！");
			return "/wares/addWares";
		}else {
			request.setAttribute("msgDelHot","删除失败！该分类下还有商品存在，导致无法删除！");
			return "/wares/addWares";
		}
	}
	
	/**
	 * 查询所有的商品属性
	 * */
	@RequestMapping(value = "/getAll", method=RequestMethod.GET)
	@ResponseBody
	public List<Hotwares> getAll() {
		List<Hotwares> hotList = hotwaresService.selectList(null);
		return hotList;
	}
	/**
	 * 添加分类
	 * */
	@RequestMapping(value = "/addhot", method=RequestMethod.GET)
	@ResponseBody
	public Msg addhot(@RequestParam("newHotName") String hotName) {
		Hotwares hotwares = new Hotwares();
		hotwares.setHotName(hotName);
		boolean b = hotwaresService.insert(hotwares);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}
	
}

