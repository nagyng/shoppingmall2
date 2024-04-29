package org.audioshop.mapper;

import org.audioshop.domain.AuthVO;
import org.audioshop.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String username);
	public AuthVO authread(String auth);

	public void insert(MemberVO member);
	public void insertSelectKey(MemberVO member);
	public int modify(MemberVO member);  
	
	
	public int delete(Long mmId);
	
}
