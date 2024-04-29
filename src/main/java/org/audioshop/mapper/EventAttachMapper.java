package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.EventAttachVO;

public interface EventAttachMapper {

	public void insert(EventAttachVO vo);
	 
	public void delete(String uuid);
	 
	public List<EventAttachVO> findByEvId(Long evId);
	 
	public void deleteAll(Long evId);
	 
	public List<EventAttachVO> getOldFiles();
	 
}
