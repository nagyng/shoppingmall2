package org.audioshop.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentVO {

	private Long coId; 
	private Long qnaId;  
	private String coContent; 
	private String userId;  
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")  
	private Date coRegDate;  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date coUpdateDate;  
	
}
//p378  	3/22