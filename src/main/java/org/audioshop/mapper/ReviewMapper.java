package org.audioshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getList();
	
	public List<ReviewVO> getListAudio();
	
	public List<ReviewVO> getListAudioOnly();
	
	public void insert(ReviewVO review);

	public void insertSelectKey(ReviewVO review);

	public ReviewVO read(Long rvId);

	public ReviewVO readOnly(Long rvId);

	public int delete(Long rvId);

	public int update(ReviewVO review);

	public List<ReviewVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);

	public void updateReplyCnt(@Param("evId") Long rvId, @Param("amount") int amount);

 


	
	
	
}
