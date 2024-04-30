package org.audioshop.domain;

import lombok.Data;

@Data
public class CartVO {
	
    private int cartId; 
    
    private String mmId;
    private String username;
    private String name;
    
    private int bookId;
    
    private int bookCount;
    
    //book
    
    private String bookName;
    
    private int bookPrice;
    
    private double bookDiscount;
    
    // 추가
    private int salePrice;
    
    private int totalPrice;
    
}
