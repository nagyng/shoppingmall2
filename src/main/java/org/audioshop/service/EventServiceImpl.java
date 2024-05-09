package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.EventAttachVO;
import org.audioshop.domain.EventVO;
import org.audioshop.mapper.EventAttachMapper;
import org.audioshop.mapper.EventMapper; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service 
@AllArgsConstructor  
@Log4j
public class EventServiceImpl implements EventService {

	@Autowired
	private EventMapper mapper;
	 
	@Autowired
	private EventAttachMapper attachMapper;
	 
	@Transactional
	@Override
	public void register(EventVO event) {  
		log.info("신규 게시물 등록:" + event);
		mapper.insertSelectKey(event); 
		if(event.getAttachList() == null || event.getAttachList().size() == 0) {
			return;
		}  
		event.getAttachList().forEach(attach -> { 
			attach.setEvId(event.getEvId()); 
			attachMapper.insert(attach);
		});
	}

	@Override
	public EventVO get(Long evId) {  
		return mapper.read(evId);
	}

	@Transactional
	@Override
	public boolean modify(EventVO event) { 
		attachMapper.deleteAll(event.getEvId()); 
		boolean modifyResult = mapper.update(event) == 1; 
		if(modifyResult && event.getAttachList() != null && event.getAttachList().size() > 0) { 
			event.getAttachList().forEach(attach -> { 
				attach.setEvId(event.getEvId());
				attachMapper.insert(attach);
			});
		} 
		return modifyResult;
	}
 
	@Transactional
	@Override
	public boolean remove(Long evId) { 
		attachMapper.deleteAll(evId); 
		return mapper.delete(evId) == 1;
	}

	@Override
	public List<EventVO> getList(Criteria cri) {  
		return mapper.getListWithPaging(cri);
	}
 
	@Override
	public int getTotal(Criteria cri) { 
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<EventAttachVO> getAttachList(Long evId) { 
		return attachMapper.findByEvId(evId);
	}
 

	
}
