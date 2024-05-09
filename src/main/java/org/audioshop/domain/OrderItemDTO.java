package org.audioshop.domain;

import lombok.Data; 

@Data
public class OrderItemDTO { 

	/* 주문 번호 */
	private String orderId;

	/* 상품 번호 */ 
    private Long auId; 
    
	/* 주문 수량 */
    private int auCount;
    
	/* vam_orderItem 기본키 */
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int auPrice;
    
	/* 상품 할인 율 */
    private double auDiscount;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;
	
    
    

	@Override
	public String toString() {
		return "OrderItemDTO [orderId=" + orderId + ", auId=" + auId + ", auCount=" + auCount + ", orderItemId="
				+ orderItemId + ", auPrice=" + auPrice + ", auDiscount=" + auDiscount + ", savePoint="
				+ savePoint + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", totalSavePoint="
				+ totalSavePoint + "]";
	}
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.auPrice * (1-this.auDiscount));
		this.totalPrice = this.salePrice*this.auCount;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.auCount;
	}		
    
    
	
    
    
}
