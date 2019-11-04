package ink.tsg.wares.controller;

import java.io.File;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.untils.Msg;
import ink.tsg.wares.beans.Wares;
import ink.tsg.wares.service.WaresService;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
@Controller
@RequestMapping("/wares")
public class WaresController {
	/**
	 * 文件保存的路径
	 */
	public static final String UPLOAD_PATH = "F:\\workspace\\spring-boot\\mall_fashion03\\src\\main\\webapp\\upload";

	@Autowired
	private WaresService wService;
	
	
	/**
	 * 前端页面的左侧导航栏
	 * */
	@RequestMapping(value="/getByConditions",method=RequestMethod.GET)
	public String getByConditions(Wares wares,HttpServletRequest req) {
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		if(wares.getWaresOfMan() != null) {
			wrapper.eq("wares_of_man",wares.getWaresOfMan());
		}
		if(wares.getWaresSeaso() != null) {
			wrapper.eq("wares_seaso",wares.getWaresSeaso());
		}
		if(wares.getWaresName() != null) {
			wrapper.like("wares_name",wares.getWaresName());
		}
		if(wares.getWaresClothingId() != null) {
			wrapper.eq("wares_clothing_id",wares.getWaresClothingId());
		}
		if(wares.getWaresHotId() != null) {
			wrapper.eq("wares_hot_id",wares.getWaresHotId());
		}
		List<Wares> list = wService.selectList(wrapper);
		req.setAttribute("list", list);
		
		return "forward:/fashion_page/conditionsWares.jsp";
	}
	
	
	/**
	 * 根据Id拿到图片，用于前台支付时，回显图片给用户看
	 * */
	@RequestMapping(value="/getWaresImg",method=RequestMethod.GET)
	@ResponseBody
	public Msg getWaresImg(@RequestParam("id")Integer waresId) {
		Wares selectById = wService.selectById(waresId);
		return Msg.success().add("imgPath",selectById.getWaresImg());
	}
	/**
	   * 前端猜你喜欢模块
	 * */
	@RequestMapping(value="/similarWares",method=RequestMethod.GET)
	@ResponseBody
	public Msg similarWares(@RequestParam("keyWordsOfMan")String keyWordsOfMan,@RequestParam("keyWordsSeaso")String keyWordsSeaso,@RequestParam("waresId")Integer waresId) {
		
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		wrapper.eq("wares_of_man",keyWordsOfMan)
			   .eq("wares_seaso",keyWordsSeaso)
			   .ne("wares_id", waresId);
		List<Wares> list = wService.selectList(wrapper);
		return Msg.success().add("similarWares", list);
	}
	
	/**
	 * 根据id查询一条商品信息
	 * */
	@RequestMapping(value="/getById",method=RequestMethod.GET)
	public String getById(@RequestParam("id")Integer id,HttpServletRequest res) {
		Wares selectById = wService.selectById(id);
		res.setAttribute("wares", selectById);
		res.setAttribute("ImgPath", selectById.getWaresImg());
		return "forward:/fashion_page/single.jsp";
	}
	
	/**
	 * 查询热销商品
	 * */
	@RequestMapping(value="/getByOtherId",method=RequestMethod.GET)
	@ResponseBody
	public List<Wares> getByHot(@RequestParam("id")Integer wares_hot_id){
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		wrapper.eq("wares_hot_id", wares_hot_id);
		List<Wares> list = wService.selectList(wrapper);
		return list;
	}
	
	
	/**
	 * 批量删除/单个删除传一个id即可
	 * */
	@RequestMapping(value="/delWares",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCusts(@RequestBody List<Integer> waresIds) {
		try {
			boolean b = wService.deleteBatchIds(waresIds);
			return Msg.success().add("msg", "删除成功！");
		} catch (Exception e) {
			return Msg.fail().add("msg", "删除失败！");
		}
	}
	
	
	/**
	 * 查询所有商品信息
	 */
	@RequestMapping(value="/getAllWares",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllWares(@RequestBody Map map) {
		// 获取所有关键字
		List keydatas = (List) map.get("keydatas");
		// 新建一个map存储关键字，用关键字的的name作为key
		Map<String, String> keys = new HashMap<String, String>();
		for (int i = 0; i < keydatas.size(); i++) {
			Map object2 = (Map) keydatas.get(i);
			String value = (String) object2.get("value");
			keys.put((String) object2.get("name"), value == ""?null:value);
		}
		int page = (int) map.get("page");
		int limit= (int) map.get("limit");
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		if(keys.get("waresName") != null) {
			wrapper.like("wares_name", keys.get("waresName"));
		}
		if(!keys.get("waresSeaso").equals("null")) {
			wrapper.eq("wares_seaso", keys.get("waresSeaso"));
		}
		if(!keys.get("waresOfMan").equals("null")) {
			wrapper.eq("wares_of_man", keys.get("waresOfMan"));
		}
		if(keys.get("peice_min") != null && keys.get("peice_min") != null ) {
			wrapper.between("wares_price", keys.get("peice_min"), keys.get("price_max"));
		}
		if(!keys.get("waresHotId").equals("0")) {
			wrapper.eq("wares_hot_id", keys.get("waresHotId"));
		}
		if(!keys.get("waresClothingId").equals("0")) {
			wrapper.eq("wares_clothing_id", keys.get("waresClothingId"));
		}
		wrapper.eq("wares_del", 1);
		List<Wares> selectMapsPage = wService.selectMapsPageWithOther(new Page<>(page, limit), wrapper);
		int count = wService.selectCount(wrapper);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("code", 0);
		resultMap.put("msg", "所有商品");
		resultMap.put("count", count);
		resultMap.put("data", selectMapsPage);
		return resultMap;
	}
	
	/**
	 * 统计商品
	 * */
	@RequestMapping(value="/staWares",method=RequestMethod.GET)
	@ResponseBody
	public Msg staWares() {
		
		EntityWrapper<Wares> wrapperSpring = new EntityWrapper<>();
		wrapperSpring.eq("wares_seaso", "春季");
		int springCount = wService.selectCount(wrapperSpring);
		
		EntityWrapper<Wares> wrapperSummer = new EntityWrapper<>();
		wrapperSummer.eq("wares_seaso", "夏季");
		int summerCount = wService.selectCount(wrapperSummer);
		
		EntityWrapper<Wares> wrapperAutumn = new EntityWrapper<>();
		wrapperAutumn.eq("wares_seaso", "秋季");
		int autumnCount = wService.selectCount(wrapperAutumn);
		
		EntityWrapper<Wares> wrapperWinter = new EntityWrapper<>();
		wrapperWinter.eq("wares_seaso", "秋季");
		int winterCount = wService.selectCount(wrapperWinter);
		
		EntityWrapper<Wares> wrapperPrice100 = new EntityWrapper<>();
		wrapperPrice100.between("wares_price", 0, 100);
		int priceCount100 = wService.selectCount(wrapperPrice100);
		
		EntityWrapper<Wares> wrapperPrice300 = new EntityWrapper<>();
		wrapperPrice300.between("wares_price", 101, 300);
		int priceCount300 = wService.selectCount(wrapperPrice300);
		
		EntityWrapper<Wares> wrapperPrice500 = new EntityWrapper<>();
		wrapperPrice500.between("wares_price", 301, 500);
		int priceCount500 = wService.selectCount(wrapperPrice500);
		
		EntityWrapper<Wares> wrapperPriceOut500 = new EntityWrapper<>();
		wrapperPriceOut500.between("wares_price", 501, 99999);
		int priceCountOut500 = wService.selectCount(wrapperPriceOut500);
		
		return Msg.success().add("springCount", springCount)
				.add("summerCount", summerCount)
				.add("autumnCount", autumnCount)
				.add("winterCount", winterCount)
				.add("priceCount100", priceCount100)
				.add("priceCount300", priceCount300)
				.add("priceCount500", priceCount500)
				.add("priceCountOut500", priceCountOut500);
	}
	
	/**
	 * 添加商品
	 */
	@RequestMapping(value = "/addWare", method = RequestMethod.POST)
	@ResponseBody
	public Msg addWare(@RequestParam("file") CommonsMultipartFile file, Wares wares) {
		
		if(wares.getWaresHotId() == 0) {
			return Msg.fail().add("error", "请选择商品属性！");
		}
		if(wares.getWaresClothingId() == 0) {
			return Msg.fail().add("error", "请选择商品分类！");
		}
		if(wares.getWaresOfMan().equals("null")) {
			return Msg.fail().add("error", "请选择使用人群！");
		}
		if(wares.getWaresSeaso().equals("null")) {
			return Msg.fail().add("error", "请选择适用季节！");
		}
		// 提取文件上传的方法
		String fileName = uploadFile(file);
		if (fileName == null) {
			return Msg.fail().add("error", "文件格式或大小有误！");
		} else {
			wares.setWaresImg("/file/"+fileName);
			boolean b = wService.insert(wares);
			if (b) {
				return Msg.success();
			}
			return Msg.fail().add("error", "添加失败！");
		}

	}
	/**
	 * 修改商品
	 * */
	@RequestMapping(value = "/editWare", method = RequestMethod.POST)
	@ResponseBody
	public Msg editWare(@RequestParam("file") CommonsMultipartFile file, Wares wares) {
		EntityWrapper<Wares> wrapper = new EntityWrapper<>();
		wrapper.eq("wares_id", wares.getWaresId());
		// 先得到之前的图片路径
		List<Wares> oldWaresImg = wService.selectMapsPageWithOther(new Page<>(1, 1), wrapper);
		String waresImg = oldWaresImg.get(0).getWaresImg();

		if (file.getSize() > 0) { // 更新了图片
			// 提取文件上传的方法
			String fileName = uploadFile(file);
			if (fileName == null) {
				return Msg.fail().add("error", "文件格式或大小有误！");
				} else {
					wares.setWaresImg("/file/" + fileName);
					boolean b = wService.update(wares, wrapper);
					if (b) {
						delOldImg(waresImg);
						return Msg.success().add("success", "修改成功！");
					} else {
						return Msg.fail().add("error", "图片修改失败！");
					}
			}
		} else { // 没有更新图片
			wService.update(wares, wrapper);
			return Msg.success().add("success", "修改成功！");
		}
	}
	


	// ===========页面的跳转================
	@RequestMapping(value = "/addWares", method = RequestMethod.GET)
	public String addWares() {
		return "wares/addWares";
	}
	@RequestMapping(value = "/statisticsWares", method = RequestMethod.GET)
	public String statisticsWares() {
		return "wares/statisticsWares";
	}

	@RequestMapping(value = "/allWares", method = RequestMethod.GET)
	public String allWares() {
		return "wares/allWares";
	}

	//删除之前的图片
	private void delOldImg(String waresImg) {
		String substring = waresImg.substring(waresImg.lastIndexOf("/"));
		File f = new File(UPLOAD_PATH+substring);
		boolean b = f.delete();
		if(b) {
			System.out.println("原来的照片路径："+UPLOAD_PATH+substring+" 删除成功！");
		}
	}
	
	// 文件上传
	public String uploadFile(CommonsMultipartFile uploadFile) {
		try {
			String filename = uploadFile.getOriginalFilename();
			String substring = filename.substring(filename.lastIndexOf("."));
			if (substring.equals(".jpg") || substring.equals(".png")) {
				long size = uploadFile.getSize();
				if (size > 1048576) {
					return null;
				}
				long time = new Date().getTime();
				String newName = time + filename;

				File file = new File(UPLOAD_PATH + "/" + newName);

				InputStream inputStream = uploadFile.getInputStream();

				FileUtils.copyInputStreamToFile(inputStream, file);

				if (inputStream != null) {
					inputStream.close();
				}
				return newName;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
