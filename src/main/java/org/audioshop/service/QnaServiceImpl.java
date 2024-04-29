package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.QnaAttachVO;
import org.audioshop.domain.QnaVO;
import org.audioshop.mapper.QnaAttachMapper;
import org.audioshop.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
 
@Service 
@AllArgsConstructor 
@Log4j 
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;
	
	//p566 첨부파일 Mapper 선언
	@Autowired
	private QnaAttachMapper attachMapper;
	
	//게시물 등록 & 첨부파일 등록
	@Transactional
	@Override
	public void register(QnaVO qna) {
		
		log.info("신규 문의글 등록:" + qna);
		
		//게시물 등록처리
		mapper.insertSelectKey(qna);
		
		//p567 첨부파일 등록처리
		if(qna.getAttachList() == null || qna.getAttachList().size() == 0) {
			return;
		}
		
		//첨부파일을 테이블에 추가
		qna.getAttachList().forEach(attach -> {
			
			//첨부파일내역에 게시물번호를 대입
			attach.setQnId(qna.getQnId());
			
			attachMapper.insert(attach);
		});
	}

	@Override
	public QnaVO get(Long qnId) {
		
		log.info("문의글 상세보기:" + qnId);
		
		return mapper.read(qnId);
	}

	//특정 게시물 수정 처리
	@Transactional
	@Override
	public boolean modify(QnaVO qna) {
		
		//p591 특정 게시물 번호에 대한 첨부파일을 모두 삭제
		attachMapper.deleteAll(qna.getQnId());
		
		//게시물을 수정
		boolean modifyResult = mapper.update(qna) == 1;
				
		//첨부파일이 존재하면 반복문을 사용하여 첨부파일 테이블에
		//추가
		if(modifyResult && qna.getAttachList() != null && qna.getAttachList().size() > 0) {
			
			qna.getAttachList().forEach(attach -> {
				
				attach.setQnId(qna.getQnId());
				attachMapper.insert(attach);
			});
		}
		
		
		return modifyResult;
	}

	//특정 게시물 삭제 처리 & 첨부파일 삭제
	@Transactional
	@Override
	public boolean remove(Long qnId) {
		
		//첨부파일을 삭제처리
		attachMapper.deleteAll(qnId);
		
		//게시물 내역을 삭제처리
		return mapper.delete(qnId) == 1;
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		
		log.info("문의글 목록 ...");
		
		return mapper.getListWithPaging(cri);
	}

	/* 전체행수 구하기 */
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<QnaAttachVO> getAttachList(Long qnId) {
		
		//특정 게시물에 대한 첨부파일 목록
		return attachMapper.findByQnId(qnId);
	}

}
