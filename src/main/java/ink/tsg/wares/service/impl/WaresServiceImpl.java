package ink.tsg.wares.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import ink.tsg.wares.beans.Wares;
import ink.tsg.wares.mapper.WaresMapper;
import ink.tsg.wares.service.WaresService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-10-12
 */
@Service
public class WaresServiceImpl extends ServiceImpl<WaresMapper, Wares> implements WaresService {
	
	@Autowired
	private WaresMapper wMapper;
	
	
	/**
	 * 联合查询出其他信息
	 * */
	public List<Wares> selectMapsPageWithOther(Page page, EntityWrapper<Wares> wrapper) {
		List<Wares> mapsPageWithOther = wMapper.selectMapsPageWithOther(page, wrapper);
		return mapsPageWithOther;
	}


	@Override
	public Wares selectOtherById(Integer waresId) {
		Wares wares = wMapper.selectOtherById(waresId);
		return wares; 
	}


}
