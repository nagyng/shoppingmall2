package org.audioshop.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;


@Data // = @Getter, @Setter, @ToString
public class Criteria {

	private int pageNum;		//현재 페이지 번호
	private int amount;			//한 페이지 당 게시물 행 수 
	 
	//검색 조건(제목,내용,작성자 등)
	private String type;
	//검색 문자열
	private String keyword;
	
	public Criteria() {			//매개변수 두 개 생성자를 호출. 
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	 
	public String[] getTypeArr() { 
		return type == null ? new String[] {} : type.split("");
	}
	 
	//현재페이지번호(pageNum), 페이지당 글행수(amount), 검색조건(type), 검색문자열(keyword) 을
	//필요 시 특정 url 에 매개변수로 전달하기 위해 사용 
	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
				
	}
	
	

}
//p293 	3/20
