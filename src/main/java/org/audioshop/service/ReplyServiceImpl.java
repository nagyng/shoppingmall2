package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReplyPageDTO;
import org.audioshop.domain.ReplyVO;
import org.audioshop.mapper.QnaMapper;
import org.audioshop.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

//(서비스)구현객체
@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;

	//p484		3/27
	//tbl_board 테이블에 댓글 건수 처리 
	@Autowired
	private QnaMapper qnamapper;

	//p484		3/27
	//댓글 등록, tbl_board 테이블의 댓글건수 +1 
	//모두 성공하면 commit, 하나라도 실패 시 rollback 
	@Transactional
	//신규댓글입력 ReplyMapper 인터페이스에 처리 (insert 메서드)
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("ReplyVO레지스터........." + vo);
		
		qnamapper.updateReplyCnt(vo.getQnId(), 1);
		
		return mapper.insert(vo);
	
	}

	//특정댓글상세 ReplyMapper 인터페이스에 처리 
	@Override
	public ReplyVO get(Long reId) {
		// TODO Auto-generated method stub

		log.info("ReplyVO겟........." + reId);
		
		return mapper.read(reId);
		
	}

	@Transactional
	//특정댓글수정 ReplyMapper 인터페이스에 처리 
	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub

		log.info("ReplyVO모디파이........." + vo);
		
		return mapper.update(vo);
	}

	//특정댓글삭제 ReplyMapper 인터페이스에 처리 
	@Override
	public int remove(Long reId) {
		// TODO Auto-generated method stub

		log.info("ReplyVO리무브........." + reId);
		
		//댓글 삭제 시 게시물번호를 알기 위해 댓글내역 가져오기 실행 
		ReplyVO vo = mapper.read(reId);
		
		qnamapper.updateReplyCnt(vo.getQnId(), -1);
		
		return mapper.delete(reId);
		
	}

	//댓글목록 ReplyMapper 인터페이스에 처리 
	@Override
	public List<ReplyVO> getList(Criteria cri, Long qnId) {
		// TODO Auto-generated method stub

		log.info("ReplyVOget Ready List of a QNA " + qnId);
		
		return mapper.getListWithPaging(cri, qnId);
		
	}  

	
	//p434		3/26
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long qnId) {
		
		return new ReplyPageDTO(
				mapper.getCountByQnId(qnId),
				mapper.getListWithPaging(cri, qnId)
				);
	}
	
	

}
//p389  	3/25