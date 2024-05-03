package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.CartDTO;
import org.audioshop.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
  
@Log4j
@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	 

	@Override
	public int addCart(CartDTO cart) {

		// 장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cart);

		//log.info(checkCart);
		//log.info(cart);
		
		//cartMapper.addCart(cart);
		//return 2; 
		
		//장바구니 db에 데이터가 이미 존재하면 2 반환 
		if(checkCart != null) {
			log.info("2");
			
			return 2;
		}
		
		//throws Exception 부분
		// 장바구니 등록 & 에러 시 0반환 
		try {
			cartMapper.addCart(cart);
			log.info("카트에 담았습니다.");
			return 1;
			
		} catch (Exception e) {
			log.info("에러 발생");
			return 0;
		}		
		
	}

	@Override
	public List<CartDTO> getCartList(String username) {
		
		List<CartDTO> cart = cartMapper.getCart(username);
		
		for(CartDTO dto : cart) { 
			/* 종합 정보 초기화 */
			dto.initSaleTotal(); 
		} 
		
		return cart; 
	}
	
	@Override
	public int modifyCount(CartDTO cart) {
		
		return cartMapper.modifyCount(cart);
	}	
	
	@Override
	public Long deleteCart(Long caId) {

		return cartMapper.deleteCart(caId);
	}	
	
	
}
