package org.audioshop.domain;

import java.util.List;

import jakarta.validation.constraints.Min;
import lombok.Data;

@Data
public class CartDTO {
	
	//cart table 속성 	
    private Long caId; 			//cartId
    private String username; 	//memberId
    private Long auId; 			 
    @Min(value = 1, message = "최소 1개 이상 담아주세요")
    private int auCount;		 
    
    //상품 정보 
    private String auTitle; 
    private int auPrice; 
    private double auDiscount;  
    
    //추가
    private int salePrice; 		//realprice
    private int totalPrice;		//realprice*count
    
    
    //salePrice, totalPrice 변수값 초기화 메서드 
    //두 변수 값 변경 
	public void initSaleTotal() {
		this.salePrice = (int) (this.auPrice * (1-this.auDiscount));
		this.totalPrice = this.salePrice*this.auCount;
	}
}
