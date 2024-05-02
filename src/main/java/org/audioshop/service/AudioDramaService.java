package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.AudioDramaAttachVO;
import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;

public interface AudioDramaService {
 

	public void register(AudioDramaVO audio);
	 
	public AudioDramaVO get(Long auId);
	 
	public boolean modify(AudioDramaVO audio);
	 
	public boolean remove(Long auId); 
	 
	public List<AudioDramaVO> getList(Criteria cri);
	 
	public int getTotal(Criteria cri);
	
	
	
 
	public List<AudioDramaAttachVO> getAttachList(Long auId);
	 
}
