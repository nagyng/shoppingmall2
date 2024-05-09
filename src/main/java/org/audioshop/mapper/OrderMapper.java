package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.MemberVO;
import org.audioshop.domain.OrderDTO;
import org.audioshop.domain.OrderItemDTO;
import org.audioshop.domain.OrderPageItemDTO;

public interface OrderMapper {

	/* 주문 상품 정보(주문 페이지) */	
	public OrderPageItemDTO getGoodsInfo(Long auId);	
	
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(Long auId);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);	

	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);

	public int enrollOrderItemSelectKey(OrderItemDTO orid);
	 
	
	/* 주문 금액 차감 */
	public int deductMoney(MemberVO member);	
	
	/* 주문 재고 차감 */
	public int deductStock(AudioDramaVO audiodrama);	
	
	/* 주문 취소 */
	public int orderCancel(String orderId);
	
	/* 주문 상품 정보(주문취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/* 주문 정보(주문취소) */
	public OrderDTO getOrder(String orderId);
	
}
