package ink.tsg.customer.service.impl;

import ink.tsg.customer.beans.Customer;
import ink.tsg.customer.mapper.CustomerMapper;
import ink.tsg.customer.service.CustomerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-10-02
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements CustomerService {

}
