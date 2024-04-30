package org.audioshop.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EventVO {

	private Long evId;  
	private String evTitle; 
	private String evContent; 
	
	private String username;
    private String mmId; 
    private String name;
    
	private int evViews; 
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date evRegdate; 
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date evUpdateDate;  
  
	private List<EventAttachVO> attachList;

}



