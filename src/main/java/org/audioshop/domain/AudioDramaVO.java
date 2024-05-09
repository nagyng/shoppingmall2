package org.audioshop.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AudioDramaVO { 

	private Long auId; 
	private String auTitle;
	private String auContent;
	private String auWriter;
	private String auArt;
	private String auCompany;
	private int auPrice; 
	private int auGenre; 
	private int auStatus; 
	private int auQuantity; 	//재고 수
	private int auCode1;		//단편, 시리즈물
	private int auCode2;		//예약판, 일반판 

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date auRegDate;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date auUpdateDate;
	
	private int code;			//공용코드테이블
	private String codename;	//코드 의미
	 
	
	private int auDiscount; 
 

	private List<AudioDramaAttachVO> attachList;
	
}
