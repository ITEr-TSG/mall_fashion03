package ink.tsg.WaresRemark.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import ink.tsg.WaresRemark.beans.WaresRemark;
import ink.tsg.WaresRemark.mapper.WaresRemarkMapper;
import ink.tsg.WaresRemark.service.WaresRemarkService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-03
 */
@Service
public class WaresRemarkServiceImpl extends ServiceImpl<WaresRemarkMapper, WaresRemark> implements WaresRemarkService {

	@Autowired
	private WaresRemarkMapper weMapper;
	
}
