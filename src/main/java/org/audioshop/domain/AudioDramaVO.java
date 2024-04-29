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
	private String auGenre; 
	private String auStatus; 
	private int auQuantity; 

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date auRegDate;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date auUpdateDate;
	
	
}
