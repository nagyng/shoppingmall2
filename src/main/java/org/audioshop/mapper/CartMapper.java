package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.CartDTO;

public interface CartMapper {
	
	/* 카트 추가 */
	//public int addCart(CartDTO cart) throws Exception;
	public int addCart(CartDTO cart);
	
	/* 카트 삭제 */
	public Long deleteCart(Long caId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/* 카트 목록 */
	public List<CartDTO> getCart(String username);	
	
	/* 카트 확인 */
	public CartDTO checkCart(CartDTO cart);
	
	
}
