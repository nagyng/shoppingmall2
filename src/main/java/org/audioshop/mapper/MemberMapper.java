package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.AuthVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String username);
	public AuthVO authread(String auth);

	public void insert(MemberVO member);
	public void insertSelectKey(MemberVO member);
	public int modify(MemberVO member);  
	
	
	public int delete(Long mmId);
	
	
	/* 주문자 주소 정보 */ 
	public MemberVO getMemberInfo(String username);
	

	
	/* 작가 목록 */
	public List<MemberVO> getList(Criteria cri);
	/* 작가 총 수 */
	public int getTotal(Criteria cri);

	
	
	
	
}
