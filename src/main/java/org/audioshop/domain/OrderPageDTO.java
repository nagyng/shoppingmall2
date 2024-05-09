package org.audioshop.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderPageDTO {


	private List<OrderPageItemDTO> orders;

	public List<OrderPageItemDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderPageItemDTO> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
	
}
