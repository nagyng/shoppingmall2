package org.audioshop.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class MemberVO {
	 
	private Long mmId; 
	private String username; 
	private String password;
	private String name; 
	private int age;
	private String gender;
	private String email;
	private int point;
	private int grade;
	private String zipcode;
	private String address1;
	private String address2;

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date regDate;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date updateDate;

	private List<AuthVO> authList;
 
	

}
