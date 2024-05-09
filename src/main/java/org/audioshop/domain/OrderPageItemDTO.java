package org.audioshop.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderPageItemDTO {
	
	
	/* 뷰로부터 전달받을 값 */
    private Long auId;
    
    private int auCount;
    
	/* DB로부터 꺼내올 값 */
    private String auTitle;
    
    private int auPrice;
    
    private double auDiscount;
    
	/* 만들어 낼 값 */
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    
	/* 상품 이미지 */
	private List<AttachFileDTO> imageList;	    
 

	public void initSaleTotal() {
		this.salePrice = (int) (this.auPrice * (1-this.auDiscount));
		this.totalPrice = this.salePrice*this.auCount;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.auCount;
		
	}

	public List<AttachFileDTO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachFileDTO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "OrderPageItemDTO [auId=" + auId + ", auCount=" + auCount + ", auTitle=" + auTitle
				+ ", auPrice=" + auPrice + ", auDiscount=" + auDiscount + ", salePrice=" + salePrice
				+ ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint=" + totalPoint + ", imageList="
				+ imageList + "]";
	}

	

}
