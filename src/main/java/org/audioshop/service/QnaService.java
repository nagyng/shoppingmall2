package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.QnaAttachVO;
import org.audioshop.domain.QnaVO;

public interface QnaService {

	//신규 게시물 등록
	public void register(QnaVO qna);
	
	//특정 게시물 번호에 대한 상세내역 
	public QnaVO get(Long qnId);
	
	//특정 게시물 번호 수정 처리
	public boolean modify(QnaVO qna);
	
	//특정 게시물 번호 삭제 처리
	public boolean remove(Long qnId);
	 
	//게시물 페이징 처리
	//p299  	3/20
	public List<QnaVO> getList(Criteria cri);
	
	//p323  	3/21
	//전체 행 수 구하기
	public int getTotal(Criteria cri);
	
	
	//p569
	//첨부파일 목록 가져오기
	public List<QnaAttachVO> getAttachList(Long qnId);
	
}
