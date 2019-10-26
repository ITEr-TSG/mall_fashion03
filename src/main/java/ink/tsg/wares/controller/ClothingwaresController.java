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
import ink.tsg.wares.beans.Clothingwares;
import ink.tsg.wares.beans.Wares;
import ink.tsg.wares.service.WaresService;
import ink.tsg.wares.service.impl.ClothingwaresServiceImpl;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
@Controller
@RequestMapping("/clothingwares")
public class ClothingwaresController {

	@Autowired
	private ClothingwaresServiceImpl clothingWaresService;
	
	@Autowired
	private WaresService wService;
	
	/**
	 * 查询所有商品分类
	 * */
	@RequestMapping(value="/getAll",method=RequestMethod.GET)
	@ResponseBody
	public List<Clothingwares> getAll(){
		List<Clothingwares> list = clothingWaresService.selectList(null);
		return list;
	}
	
	/**
	 * 添加分类
	 * */
	@RequestMapping(value = "/addclothing", method=RequestMethod.GET)
	@ResponseBody
	public Msg addhot(@RequestParam("newClothingName") String clothingName) {
		Clothingwares clothingwares = new Clothingwares();
		clothingwares.setClothingName(clothingName);
		boolean b = clothingWaresService.insert(clothingwares);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
		
	}
	/**
	 * 删除分类
	 * */
	@RequestMapping(value="/delClothing",method=RequestMethod.GET)
	public String delClothing(@RequestParam("clothingId") Integer clothingId,HttpServletRequest request) {
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		wrapper.eq("wares_clothing_id", clothingId);
		int count = wService.selectCount(wrapper);
		if(count == 0) {
			boolean b = clothingWaresService.deleteById(clothingId);
			request.setAttribute("msgDelClothing","删除成功！");
			return "/wares/addWares";
		}else {
			request.setAttribute("msgDelClothing","删除失败！该分类下还有商品存在，导致无法删除！");
			return "/wares/addWares";
		}
	}
}

