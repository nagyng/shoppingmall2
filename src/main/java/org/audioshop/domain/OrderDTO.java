package org.audioshop.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {


	/* 주문 번호 */
	private String orderId;
	
	/* 배송 받는 사람 */
	private String addressee;
	
	/* 주문 회원 아이디 */
	private String username;
	
	/* 우편번호 */
	private String zipcode;
	
	/* 회원 주소 */
	private String address1;
	
	/* 회원 상세주소 */
	private String address2;
	
	/* 주문 상태 */
	private String orderState;
	
	/* 주문 상품 */
	private List<OrderItemDTO> orders;	
	
	/* 배송비 */
	private int deliveryCost;
	
	/* 사용 포인트 */
	private int usePoint;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	
	/* 판매가(모든 상품 비용) */
	private int orderSalePrice;
	
	/* 적립 포인트 */
	private int orderSavePoint;
	
	/* 최종 판매 비용 */
	private int orderFinalSalePrice;
	
	
	private Long auId;

	
	
	
	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", addressee=" + addressee + ", username=" + username + ", zipcode="
				+ zipcode + ", address1=" + address1 + ", address2=" + address2 + ", orderState="
				+ orderState + ", orders=" + orders + ", deliveryCost=" + deliveryCost + ", usePoint=" + usePoint
				+ ", orderDate=" + orderDate + ", orderSalePrice=" + orderSalePrice + ", orderSavePoint="
				+ orderSavePoint + ", orderFinalSalePrice=" + orderFinalSalePrice + "]";
	}	
	
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderItemDTO order : orders) {
				orderSalePrice += order.getTotalPrice();
				orderSavePoint += order.getTotalSavePoint();
			}
		/* 배송비용 */
			if(orderSalePrice >= 30000) {
				deliveryCost = 0;
			} else {
				deliveryCost = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
	}	
	
	
}
