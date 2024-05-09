package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.AudioDramaAttachVO;

public interface AudioDramaAttachMapper {


	public void insert(AudioDramaAttachVO vo);
	 
	public void delete(String uuid);
	 
	public List<AudioDramaAttachVO> findByAuId(Long auId);
	 
	public void deleteAll(Long auId);
	 
	public List<AudioDramaAttachVO> getOldFiles();
}
