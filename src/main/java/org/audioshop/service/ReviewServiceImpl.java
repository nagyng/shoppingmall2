package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReplyVO;
import org.audioshop.domain.ReviewAttachVO;
import org.audioshop.domain.ReviewVO;
import org.audioshop.mapper.ReviewAttachMapper;
import org.audioshop.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service 
@AllArgsConstructor  
@Log4j
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	 
	@Autowired
	private ReviewAttachMapper attachMapper;
	 
	@Transactional
	@Override
	public void register(ReviewVO review) {  
		log.info("신규 게시물 등록:" + review);
		mapper.insertSelectKey(review); 
		if(review.getAttachList() == null || review.getAttachList().size() == 0) {
			return;
		}  
		review.getAttachList().forEach(attach -> { 
			attach.setEvId(review.getRvId()); 
			attachMapper.insert(attach);
		});
	}

	@Override
	public ReviewVO get(Long rvId) {  
		return mapper.read(rvId);
	}

	@Transactional
	@Override
	public boolean modify(ReviewVO review) { 
		attachMapper.deleteAll(review.getRvId()); 
		boolean modifyResult = mapper.update(review) == 1; 
		if(modifyResult && review.getAttachList() != null && review.getAttachList().size() > 0) { 
			review.getAttachList().forEach(attach -> { 
				attach.setEvId(review.getRvId());
				attachMapper.insert(attach);
			});
		} 
		return modifyResult;
	}
 
	@Transactional
	@Override
	public boolean remove(Long rvId) { 
		attachMapper.deleteAll(rvId); 
		return mapper.delete(rvId) == 1;
	} 
	
	/*
	@Override
	public List<ReviewVO> getList(Criteria cri) {  
		return mapper.getListWithPaging(cri);
	}
	*/
	
	
	@Override
	public int getTotal(Criteria cri) { 
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ReviewAttachVO> getAttachList(Long rvId) { 
		return attachMapper.findByRvId(rvId);
	}

	
	
	
	@Override
	public List<ReviewVO> getList(Criteria cri) {
		// TODO Auto-generated method stub 
		return mapper.getList(); 
	}

	@Override
	public List<ReviewVO> getListAudio(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListAudio();
	}

	@Override
	public List<ReviewVO> getListAudioOnly(Long auId, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListAudioOnly();
	}
	
	@Override
	public ReviewVO getOnly(Long rvId) {
		// TODO Auto-generated method stub  
		return mapper.readOnly(rvId);
		
	}
 

	
}
