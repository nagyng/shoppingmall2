package org.audioshop.service;

import org.audioshop.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO member);
	public boolean modify(MemberVO member);
	public MemberVO get(String username); 
	
	
	public boolean remove(Long mmId); 

}
