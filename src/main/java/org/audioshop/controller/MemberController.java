package org.audioshop.controller;
  

import org.audioshop.domain.AuthVO;
import org.audioshop.domain.MemberVO;
import org.audioshop.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")	 
@AllArgsConstructor 
@Log4j
public class MemberController {

	@Autowired
	private MemberService service;
	  

	@GetMapping("/401") 
	public void accessDenied(Authentication auth, Model model) { 
		log.info("접근 불가:" + auth); 
		model.addAttribute("msg","Access Denied!");
	}
 
	@GetMapping("/login") 
	public void loginInput(String error, String logout, Model model) { 
		if(error != null) {
			model.addAttribute("error", "계정을 다시 확인하세요.");
		}  
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}   
	}
 
	@GetMapping("/logout") 
	public void logoutGET() { 
		log.info("로그아웃 처리가 완료되었습니다.");
	}

	
	 
	@PostMapping("/remove")
	public String remove( @RequestParam("mmId") Long mmId, RedirectAttributes rttr, String username) { 
		if(service.remove(mmId)) { 
			rttr.addFlashAttribute("result","success");
			log.info("회원 탈퇴되었습니다.");
		} 
		return "redirect:/member/register";
	}
 
	
	
	
	
	  
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/index", produces = "text/plain; charset=UTF-8") 
	public String index() {  
	return "/member/index";

	}
  
	@GetMapping(value = "/password", produces = "text/plain; charset=UTF-8") 
	public String password() { 
	return "/member/password";

	} 

	@GetMapping(value = "/register", produces = "text/plain; charset=UTF-8") 
	public String register() { 
	return "/member/register";

	}
 
	@PostMapping("/register")
	public String register(MemberVO member, AuthVO auth, RedirectAttributes rttr) { 
		
		log.info(member);  
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		auth.setAuth("ROLE_USER"); 
		
		service.register(member); 
		rttr.addFlashAttribute("result",member.getMmId()); 
		log.info("회원가입 완료.");
		return "redirect:/member/login"; 
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/modify", produces = "text/plain; charset=UTF-8") 
	public String modify() { 
		return "/member/modify"; 
	} 
 
	 
	@PostMapping("/modify")
	public String modify(MemberVO member, AuthVO auth, RedirectAttributes rttr) {  
		log.info(member);  
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setPassword(passwordEncoder.encode(member.getPassword())); 
		log.info(member.getPassword()); 

		if(service.modify(member)) { 
			rttr.addFlashAttribute("result","success"); 
			log.info("회원수정 완료.");
		}  
		return "redirect:/member/modify";
	}
	



}
