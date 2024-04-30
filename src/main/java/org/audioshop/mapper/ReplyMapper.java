package org.audioshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReplyVO;

public interface ReplyMapper {

	//신규 댓글 등록 처리
	public int insert(ReplyVO vo);
	
	//p384 	3/22
	public ReplyVO read(Long reId);		//특정 댓글 상세 읽기
	
	//p385 	3/22
	public int delete(Long reId);		//특정 댓글 삭제
	
	//p386 	3/22 
	public int update(ReplyVO reply);	//댓글 수정
	
	//p388 	3/25
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("qnId") Long qnId
			);
	
	//p432 	3/26 
	public int getCountByQnId(Long qnId);		//댓글 건수 파악
	
	
}
//p382 	3/22