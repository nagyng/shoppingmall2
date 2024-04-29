package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.EventAttachVO;
import org.audioshop.domain.EventVO;

public interface EventService {

	public void register(EventVO event);
	 
	public EventVO get(Long evId);
	 
	public boolean modify(EventVO event);
	 
	public boolean remove(Long evId); 
	 
	public List<EventVO> getList(Criteria cri);
	 
	public int getTotal(Criteria cri);
	 
	public List<EventAttachVO> getAttachList(Long evId);
	
}
