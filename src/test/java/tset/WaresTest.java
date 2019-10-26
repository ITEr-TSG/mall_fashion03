package tset;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.wares.beans.Wares;
import ink.tsg.wares.service.impl.WaresServiceImpl;

public class WaresTest {

	@Autowired
	private WaresServiceImpl wService;

	@Test
	public void selectTest() {

		Wares oldWares = wService.selectOtherById(12);
		System.out.println(oldWares);
	}

	@Test
	public void selectCountTest() {

		EntityWrapper<Wares> wrapper = new EntityWrapper<>();

		wrapper.eq("wares_seaso", "春季");
		
		int count = wService.selectCount(wrapper);
		
		
		
		System.out.println(count);
		
	}

}
