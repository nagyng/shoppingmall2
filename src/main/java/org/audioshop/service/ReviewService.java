package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReviewAttachVO;
import org.audioshop.domain.ReviewVO;

public interface ReviewService {

	public void register(ReviewVO review);
	 
	public ReviewVO get(Long rvId);
	 
	public ReviewVO getOnly(Long rvId);
	 
	public boolean modify(ReviewVO review);
	 
	public boolean remove(Long rvId); 
	 
	public List<ReviewVO> getList(Criteria cri); 
	 
	public List<ReviewVO> getListAudio(Criteria cri); 

	public List<ReviewVO> getListAudioOnly(Long auId, Criteria cri);
	 
	public int getTotal(Criteria cri);
	 
	public List<ReviewAttachVO> getAttachList(Long rvId);
 
}
