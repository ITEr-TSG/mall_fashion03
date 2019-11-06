package ink.tsg.contact.service.impl;

import ink.tsg.contact.beans.Contact;
import ink.tsg.contact.mapper.ContactMapper;
import ink.tsg.contact.service.ContactService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-06
 */
@Service
public class ContactServiceImpl extends ServiceImpl<ContactMapper, Contact> implements ContactService {

	@Autowired
	private ContactMapper cMapper;
	
	
}
