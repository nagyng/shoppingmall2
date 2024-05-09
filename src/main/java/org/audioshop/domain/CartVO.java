package org.audioshop.domain;

import lombok.Data;

@Data
public class CartVO {
	
    private Long caId; 
    
    private String mmId;
    private String username;
    private String name;

    private Long auId;
    
    private int auCount;
    
    //audio 
    private String auName; 
    private int auPrice; 
    private double auDiscount;
    
    // 추가
    private int salePrice; 
    private int totalPrice;
    
}
