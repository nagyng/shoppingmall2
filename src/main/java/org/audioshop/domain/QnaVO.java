package org.audioshop.domain;

import java.util.Date;
import java.util.List; 
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnaVO {



	private Long qnId; //게시물번호
	private String qnTitle;//게시물제목
	private String qnContent;//게시물내용
	
	private String username;//게시물작성자
    private String mmId; 
    private String name;
    
	private int qnViews;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date qnRegdate;//게시물등록일자
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date qnUpdateDate;//게시물수정일자
  
	private int replyCnt; //댓글수
	 
	private List<QnaAttachVO> attachList;

	
}
