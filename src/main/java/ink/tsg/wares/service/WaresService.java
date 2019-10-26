package ink.tsg.wares.service;

import ink.tsg.wares.beans.Wares;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
public interface WaresService extends IService<Wares> {

	List<Wares> selectMapsPageWithOther(Page page, EntityWrapper<Wares> wrapper);
	/**
	 * 根据id查一些图片路径之类的信息
	 * */
	Wares selectOtherById(Integer waresId);

}
