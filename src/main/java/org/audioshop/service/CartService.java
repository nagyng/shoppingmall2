package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.CartDTO;

public interface CartService {
	
	/* 장바구니 추가 */
	public int addCart(CartDTO cart);	
	
	/* 장바구니 정보 리스트 */
	public List<CartDTO> getCartList(String username);	
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);		
	
	/* 카트 삭제 */
	public Long deleteCart(Long caId);	

}
