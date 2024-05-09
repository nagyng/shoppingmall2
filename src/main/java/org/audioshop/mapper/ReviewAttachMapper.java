package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.ReviewAttachVO;

public interface ReviewAttachMapper {

	public void insert(ReviewAttachVO vo);
	 
	public void delete(String uuid);
	 
	public List<ReviewAttachVO> findByRvId(Long rvId);
	 
	public void deleteAll(Long rvId);
	 
	public List<ReviewAttachVO> getOldFiles();
	 
}
