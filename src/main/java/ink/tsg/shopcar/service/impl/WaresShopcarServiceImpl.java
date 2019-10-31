package ink.tsg.shopcar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import ink.tsg.shopcar.beans.WaresShopcar;
import ink.tsg.shopcar.mapper.WaresShopcarMapper;
import ink.tsg.shopcar.service.WaresShopcarService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-10-31
 */
@Service
public class WaresShopcarServiceImpl extends ServiceImpl<WaresShopcarMapper, WaresShopcar> implements WaresShopcarService {
	
	@Autowired
	private WaresShopcarMapper wsMapper;
	
	
}
