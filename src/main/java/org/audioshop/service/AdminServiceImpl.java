package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.AudioDramaAttachVO;
import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.OrderDTO;
import org.audioshop.mapper.AdminMapper;
import org.audioshop.mapper.AudioDramaAttachMapper;
import org.audioshop.mapper.AudioDramaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service 
@AllArgsConstructor  
@Log4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;	

	@Autowired
	private AudioDramaMapper mapper;
	 
	@Autowired 
	private AudioDramaAttachMapper attachMapper;
	 
	 
	@Transactional
	@Override
	public void register(AudioDramaVO audio) {  
		log.info("신규 상품 등록:" + audio);
		mapper.insertSelectKey(audio);  
	}

	
	
	@Override
	public AudioDramaVO get(Long auId) {  
		return mapper.read(auId);
	}

	@Transactional
	@Override
	public boolean modify(AudioDramaVO audio) { 
		attachMapper.deleteAll(audio.getAuId()); 
		boolean modifyResult = mapper.update(audio) == 1; 
		if(modifyResult && audio.getAttachList() != null && audio.getAttachList().size() > 0) { 
			audio.getAttachList().forEach(attach -> { 
				attach.setAuId(audio.getAuId());
				attachMapper.insert(attach);
			});
		} 
		return modifyResult;
	}
 
	@Transactional
	@Override
	public boolean remove(Long auId) { 
		attachMapper.deleteAll(auId); 
		return mapper.delete(auId) == 1;
	}

	@Override
	public List<AudioDramaVO> getList(Criteria cri) {  
		return mapper.getListWithPaging(cri);
	}
 
	@Override
	public int getTotal(Criteria cri) { 
		return mapper.getTotalCount(cri);
	}
 
	@Override
	public List<AudioDramaAttachVO> getAttachList(Long auId) { 
		//특정 게시물에 대한 첨부파일 목록
		return attachMapper.findByAuId(auId);
	}


	 
 
	/* 주문 상품 리스트 */
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return adminMapper.getOrderList(cri);
	}
	
	/* 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return adminMapper.getOrderTotal(cri);
	}		
	
 
	
}
