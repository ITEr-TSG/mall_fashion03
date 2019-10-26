package ink.tsg.wares.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.wares.beans.Wares;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
public interface WaresMapper extends BaseMapper<Wares> {
	
	List<Wares> selectMapsPageWithOther(Page page,@Param("ew") EntityWrapper<Wares> wrapper);
	
	//@Select("select wares_id, wares_name, wares_price, wares_des, wares_hot_id, wares_of_man, wares_img, wares_clothing_id, wares_seaso, wares_size, creat_time, wares_del from tb_wares where wares_id = #{waresId}")
	Wares selectOtherById(Integer waresId);



}
