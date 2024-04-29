package org.audioshop.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data; 

@Data
@AllArgsConstructor 
public class CommentPageDTO {

	private int coCnt; 
	private List<CommentVO> list;	 


} 