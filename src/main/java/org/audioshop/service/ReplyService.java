package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReplyPageDTO;
import org.audioshop.domain.ReplyVO;
//댓글처리 서비스 
public interface ReplyService {

	//신규댓글입력 
	public int register(ReplyVO vo);
	//특정댓글상세
	public ReplyVO get(Long reId);
	//특정댓글수정
	public int modify(ReplyVO vo);
	//특정댓글삭제
	public int remove(Long reId);
	//댓글	  목록
	public List<ReplyVO> getList(Criteria cri, Long qnId); 
	//p434  	3/26
	//댓글 수 처리
	public ReplyPageDTO getListPage(Criteria cri, Long qnId);
	
}
//p389  	3/25