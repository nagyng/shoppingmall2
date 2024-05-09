package org.audioshop.domain;

import lombok.Data;

@Data
public class OrderCancelDTO {
	
	private String username;
	
	private String orderId;
	
	private String keyword;
	
	private int amount;
	
	private int pageNum;

}
