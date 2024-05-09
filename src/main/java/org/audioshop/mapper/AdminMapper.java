package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.AttachFileDTO;
import org.audioshop.domain.AudioDramaAttachVO;
import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.OrderDTO;

public interface AdminMapper {

	/* 상품 등록 */
	//public void insert(AudioDramaVO audio);  
	public void insertSelectKey(AudioDramaVO audio);
	
	/* 상품 리스트 */
	//public List<AudioDramaVO> goodsGetList(Criteria cri); 
	public List<AudioDramaVO> getList();
	public List<AudioDramaVO> getListWithPaging(Criteria cri);
	
	/* 상품 총 개수 */
	//public int goodsGetTotal(Criteria cri);	
	public int getTotalCount(Criteria cri);
	
	/* 상품 조회 페이지 */
	//public AudioDramaVO goodsGetDetail(Long auId);
	public AudioDramaVO read(Long auId);
	
	/* 상품 수정 */
	//public int goodsModify(AudioDramaVO vo);	
	public int update(AudioDramaVO audio);
	
	/* 상품 정보 삭제 */
	//public int goodsDelete(Long auId);	
	public int delete(Long auId);
	
	/* 이미지 등록 */
	//public void imageEnroll(AttachFileDTO vo);
	public void insert(AudioDramaAttachVO vo);
	
	/* 지정 상품 이미지 전체 삭제 */
	//public void deleteImageAll(Long auId);
	public void delete(String uuid);
	public void deleteAll(Long auId);
	
	/* 어제자 날짜 이미지 리스트 */
	//public List<AudioDramaAttachVO> checkFileList();
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AudioDramaAttachVO> getAttachInfo(Long auId);		
	public List<AttachFileDTO> getAttachList(Long auId); 
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);	
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);		
	
}
