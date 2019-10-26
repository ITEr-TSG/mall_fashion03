package ink.tsg.customer.mapper;

import ink.tsg.customer.beans.Customer;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ITEr
 * @since 2019-10-02
 */
public interface CustomerMapper extends BaseMapper<Customer> {
	Customer selectByMy(@Param("custId") Integer id);
}
