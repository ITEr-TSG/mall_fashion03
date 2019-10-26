package tset;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.customer.beans.Customer;
import ink.tsg.customer.mapper.CustomerMapper;

public class CustomerCRUD {
	
	ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	CustomerMapper customerMapper = cxt.getBean("customerMapper",CustomerMapper.class);
	
	/**
	 * 查询
	 * */
	@Test
	public void testSelect() {
		Customer customer = new Customer();
		customer.setCustName("wangwu");
		customer.setCustEmail("wangwu@qq.com");
		EntityWrapper<Customer> ew = new EntityWrapper<Customer>();
		ew.eq("cust_name", customer.getCustName())
		.orNew()
		.eq("cust_email",customer.getCustEmail());
		Integer selectCount = customerMapper.selectCount(ew);
		System.out.println(selectCount);
	}
	
	
	/**
	 * 更新操做
	 * */
	@Test
	public void testUpdate() {
		Customer customer = new Customer();
		customer.setCustId(30);
		customer.setCustName("wanger");
		customer.setCustNick("王二");
		customer.setCustEmail("wanger@163.com");
		customer.setCustAge(25);
		customer.setCustGender(1);
		customer.setCustPassword("123456");
		Integer updateById = customerMapper.updateById(customer);
		System.out.println(updateById);
	}
	
	
	/**
	 * 插入
	 * */
	@Test
	public void testInsert() {
		Customer customer = new Customer();
		customer.setCustName("wanger");
		customer.setCustNick("王二");
		customer.setCustEmail("wanger@qq.com");
		customer.setCustAge(25);
		customer.setCustGender(0);
		customer.setCustPassword("123456");
		Integer insert = customerMapper.insert(customer);
		System.out.println(insert);
		
	}
	/**
	 * 测试逻辑删除
	 * */
	@Test
	public void testLogicDel() {
		Integer byId = customerMapper.deleteById(23);
		System.out.println(byId);
	}
	
	
	/**
	 * 测试自己的xml方法
	 * */
	@Test
	public void testPage() {
		Customer list = customerMapper.selectByMy(22);
		System.out.println(list);
	}
	
	
	
	
	
	
	
	
}
