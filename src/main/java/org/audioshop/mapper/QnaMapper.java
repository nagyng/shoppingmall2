package org.audioshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.QnaVO;

public interface QnaMapper {

	//게시물 내역 조회
	public List<QnaVO> getList();
	
	//신규 게시물 등록
	public void insert(QnaVO qna);
	
	//신규 게시물 등록(등록시점에서 게시물번호를 가져오는 경우)
	public void insertSelectKey(QnaVO qna);
	
	//특정 게시물 번호에 대한 상세내역 처리
	public QnaVO read(Long qnId);
	
	//특정 게시물 내역 삭제 처리
	//delete 문을 수행후 delete된 행수를 리턴받는다.
	public int delete(Long qnId);
	
	//특정 게시물 내역 수정 처리
	public int update(QnaVO qna);
	
	//페이징 처리
	public List<QnaVO> getListWithPaging(Criteria cri);
	
	//전체 행수 구하기
	public int getTotalCount(Criteria cri);
	
	//p482 댓글수 처리
	public void updateReplyCnt(@Param("qnId") Long qnId,@Param("amount") int amount);
}
