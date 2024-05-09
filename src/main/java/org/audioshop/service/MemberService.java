package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO member);
	public boolean modify(MemberVO member);
	public MemberVO get(String username); 
	
	
	public boolean remove(Long mmId); 

	/* 주문자 정보 */
	public MemberVO getMemberInfo(String username);

	
	
	/* 회원 목록 */
	public List<MemberVO> getList(Criteria cri) throws Exception; 
	/* 회원 총 수 */
	public int getTotal(Criteria cri) throws Exception;
	
	
}
