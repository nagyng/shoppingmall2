package org.audioshop.domain;

import java.util.Date;

import org.audioshop.domain.ReplyVO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private Long qnId; 
	private Long reId; 
	private String content; 
	private String username; 
	private int stars;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date reReplyDate; 
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date reUpdateDate; 
	
	
	
}
