package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.QnaAttachVO;

public interface QnaAttachMapper {

	//신규 첨부파일 등록 처리
	public void insert(QnaAttachVO vo);
	
	//특정 첨부파일 삭제 처리
	public void delete(String uuid);
	
	//특정 게시물에 대한 첨부파일 목록 처리
	public List<QnaAttachVO> findByQnId(Long qnId);
	
	//게시물 삭제시 첨부파일 함께 삭제
	public void deleteAll(Long qnId);
	
	
	//p600		3/29
	//어제 기준으로 새벽 2시 삭제작업 처리 
	public List<QnaAttachVO> getOldFiles();
	
	
}
