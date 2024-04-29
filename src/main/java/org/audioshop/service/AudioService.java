package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;

public interface AudioService {
 

	public void register(AudioDramaVO event);
	 
	public AudioDramaVO get(Long auId);
	 
	public boolean modify(AudioDramaVO event);
	 
	public boolean remove(Long auId); 
	 
	public List<AudioDramaVO> getList(Criteria cri);
	 
	public int getTotal(Criteria cri);
}
