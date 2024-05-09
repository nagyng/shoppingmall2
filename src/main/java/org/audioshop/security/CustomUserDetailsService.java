package org.audioshop.security;

import org.audioshop.domain.CustomUser;
import org.audioshop.domain.MemberVO;
import org.audioshop.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j 
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
 
	@Override 
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException { 
		log.warn(username); 
		MemberVO vo = memberMapper.read(username); 
		return vo == null ? null : new CustomUser(vo); 
	}  



	
	

} 