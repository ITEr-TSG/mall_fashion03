package ink.tsg.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import ink.tsg.order.beans.Order;
import ink.tsg.order.mapper.OrderMapper;
import ink.tsg.order.service.OrderService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-01
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
	
	@Autowired
	private OrderMapper oMapper;
	
}
