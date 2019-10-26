package ink.tsg.admin.service.impl;

import ink.tsg.admin.beans.Admin;
import ink.tsg.admin.mapper.AdminMapper;
import ink.tsg.admin.service.AdminService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-10-03
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

}
