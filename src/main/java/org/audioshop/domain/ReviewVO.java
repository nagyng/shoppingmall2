package org.audioshop.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewVO {

	private Long rvId;
	private Long auId;
	
	private String username;
    private String mmId; 
    private String name;
    
	private String rvTitle; 
	private String rvContent;  
    
	private int star; 

	private String auArt;
	private String auTitle;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date rvRegDate; 
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date rvUpdateDate;  
    
  
	private List<ReviewAttachVO> attachList; 
	private ReviewDramaVO ReviewDramaVO;
	 
	
}
