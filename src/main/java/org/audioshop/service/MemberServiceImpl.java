package org.audioshop.service;
 
import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.MemberVO;
import org.audioshop.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j; 

@Service 
@AllArgsConstructor  
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private PasswordEncoder pwencoder;
	@Autowired
	private MemberMapper mapper;
  
	@Transactional
	@Override
	public void register(MemberVO member) { 
		log.info("신규 회원 가입:" + member);  
		mapper.insertSelectKey(member);  
	}

	@Transactional
	@Override
	public boolean modify(MemberVO member) { 
		log.info("회원정보 수정:" + member);  
		boolean modifyResult = mapper.modify(member) == 1;  
		return modifyResult;
	}

	@Override
	public MemberVO get(String username) { 
		return mapper.read(username);
	}

 
	
	
	
	@Transactional
	@Override
	public boolean remove(Long mmId) { 
		return mapper.delete(mmId) == 1;
	}
	
	
	

	//주문 기능 구현 
	@Override
	public MemberVO getMemberInfo(String username) {
		return mapper.getMemberInfo(username);
	}

	
	
	//관리자 페이지에서 회원 수 & 회원 목록 조회
	/* 작가 목록 */
	@Override
	public List<MemberVO> getList(Criteria cri) throws Exception { 
		return mapper.getList(cri);
	} 
	/* 작가 총 수 */
	@Override
	public int getTotal(Criteria cri) throws Exception { 
		return mapper.getTotal(cri);
	}


}
