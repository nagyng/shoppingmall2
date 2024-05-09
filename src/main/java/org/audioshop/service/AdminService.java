package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.AudioDramaAttachVO;
import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.OrderDTO;

public interface AdminService { 
  
	/* 상품 등록 */ 
	//public void bookEnroll(BookVO book);	
	public void register(AudioDramaVO audio); 
	
	/* 상품 리스트 */
	//public List<BookVO> goodsGetList(Criteria cri);
	public List<AudioDramaVO> getList(Criteria cri);
	
	/* 상품 총 개수 */
	//public int goodsGetTotal(Criteria cri);		
	public int getTotal(Criteria cri);
	
	/* 상품 조회 페이지 */
	//public BookVO goodsGetDetail(int bookId);	
	public AudioDramaVO get(Long auId);
	
	/* 상품 수정 */
	//public int goodsModify(BookVO vo);	
	public boolean modify(AudioDramaVO audio);
	
	/* 상품 정보 삭제 */
	//public int goodsDelete(int bookId);	
	public boolean remove(Long auId); 
	
	/* 지정 상품 이미지 정보 얻기 */
	//public List<AttachImageVO> getAttachInfo(int bookId);		
	public List<AudioDramaAttachVO> getAttachList(Long auId);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);		
	
	

}
