package org.audioshop.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("sample/*")
@Controller
@Log4j
public class SecurityController {

	@GetMapping("/all")
	public void doAll() {
		log.info("모든 사용자 접근");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("Member 권한 사용자만 접근");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("Admin 권한 사용자만 접근");
	}
	
	
	
	
	
	
	
}
