package org.audioshop.domain;

import lombok.Data;

@Data
public class ReviewAttachVO {

	private String uuid;  
	private String uploadPath; 
	private String fileName; 
	private boolean fileType; 
	
	private Long evId;  
}
