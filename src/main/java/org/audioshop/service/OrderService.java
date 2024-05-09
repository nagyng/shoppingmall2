package org.audioshop.service;

import java.util.List;

import org.audioshop.domain.OrderCancelDTO;
import org.audioshop.domain.OrderDTO;
import org.audioshop.domain.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);	
	
	/* 주문 */
	public void  order(OrderDTO orw);	
	
	/* 주문 취소 */
	public void orderCancel(OrderCancelDTO dto);	
	
}
