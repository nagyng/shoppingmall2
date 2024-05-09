package org.audioshop.mapper;

import org.audioshop.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
    
	@Autowired
	private MemberMapper mapper;
	 
	@Test
	public void testRead() { 
		MemberVO vo = mapper.read("admin91"); 
		vo.getAuthList().forEach(authVO -> log.info(authVO)); 
	} 
	/*

|-----|--------|-------------------------------------------------------------|------|-------|-------|------------------|------|------|--------|---------|---------|----------------------|-----------|-----------|
|mmid |userid  |userpw                                                       |name  |age    |gender |email             |point |grade |zipcode |address1 |address2 |regdate               |updatedate |auth       |
|-----|--------|-------------------------------------------------------------|------|-------|-------|------------------|------|------|--------|---------|---------|----------------------|-----------|-----------|
|92   |admin91 |$2a$10$mhFEaMdsJOwHVFh/HqYsoeCOGkiItgMW80kAKQjroQPpljYn.ZjKm |관리자91 |[null] |[null] |admin91@gmail.com |0     |10    |[null]  |[null]   |[null]   |2024-04-22 15:05:12.0 |[null]     |ROLE_ADMIN |
|-----|--------|-------------------------------------------------------------|------|-------|-------|------------------|------|------|--------|---------|---------|----------------------|-----------|-----------|

	*/

	
	
	
	
	
	
	
	
	
} 