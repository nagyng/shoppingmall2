package org.audioshop.controller;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.ReplyPageDTO;
import org.audioshop.domain.ReplyVO;
import org.audioshop.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//해당 클래스가 REST방식으로 처리된다는 어노테이션
@RestController
//클라이언트가 http://localhost:8080/replies/* 요청처리
@RequestMapping("/replies/")
//모든 필드를 매개변수로 하는 생성자를 자동으로 생성
@AllArgsConstructor
@Log4j
public class ReplyController {

	//자동주입
	@Autowired
	private ReplyService service;
	
	//신규 댓글 등록 처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new",
			     //모든 클라이언트의 요청중에서 데이터가
			     //json 형태로 들어오는 URL만 서버가 처리한다는 선언
			     consumes="application/json",
			     //서버가 클라이언트에게 응답처리시 텍스트 형태로 응답
			     produces= {MediaType.TEXT_PLAIN_VALUE})
	//서버가 클라이언트에게 응답처리시 데이터 + Http상태코드값을
	//함께 전송
	public ResponseEntity<String> create(
			//json 형태의 데이터를 자바클래스 형태로 매핑
			@RequestBody ReplyVO vo){
		
		log.info("ReplyVO:" + vo);
		
		//신규 댓글 등록 처리 완료
		int insertCount = service.register(vo);
		
		log.info("댓글 등록 건수:" + insertCount);
		
		//삼항연산자를 사용하여 Http상태코드값과 메시지를 전송
		return insertCount == 1 ?
			new ResponseEntity<>("success",HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	//댓글 목록 처리
	//{매개변수명}
	@GetMapping(value="/pages/{qnId}/{page}",
			    //클라이언트 응답 데이터 형식 선언(XML,JSON)
			    produces = {
			    	MediaType.APPLICATION_XML_VALUE,
			    	MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
			//매개변수값을 URL에서 가져온다
			@PathVariable("page") int page,
			@PathVariable("qnId") Long qnId) {
		
		log.info("getList() 실행");
		
		Criteria cri = new Criteria(page,10);
		
		log.info("cri 정보:" + cri);
		
		//정상적으로 실행되면 200번 상태코드값,댓글 리스트를
		//리턴
		return new ResponseEntity<>(service.getListPage(cri,qnId),HttpStatus.OK);
		
	}
	
	//p397 특정 댓글 상세보기
	@GetMapping(
			value="/{reId}",
			produces = {
			    	MediaType.APPLICATION_XML_VALUE,
			    	MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("reId") Long reId){
		
		return new ResponseEntity<>(service.get(reId),HttpStatus.OK);		
	}	
	
	//p397 특정 댓글 삭제 처리
	@PreAuthorize("principal.username == #vo.username") 
	@DeleteMapping(value="/{reId}")
	public ResponseEntity<String> remove(
			@RequestBody ReplyVO vo,
			@PathVariable("reId") Long reId){
	
		//특정 댓글 삭제
		return service.remove(reId) == 1 ?
			new ResponseEntity<>("success",HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
			
	}
	
	//특정 댓글 수정 처리
	@PreAuthorize("principal.username == #vo.username")
	@RequestMapping(value="/{reId}",
			        //PUT : 전체항목을 수정시 사용
			        //PATCH: 일부를 수정시 사용
			        method= {RequestMethod.PATCH,
			        		 RequestMethod.PUT},
			        //클라이언트의 요청중 JSON형태만 처리
			        consumes="application/json",
			        produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("reId") Long reId){
		
		//댓글번호를 ReplyVO 클래스의 필드에 대입
		vo.setReId(reId);
		
		return service.modify(vo) == 1 ?
				new ResponseEntity<>("success",HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
}





