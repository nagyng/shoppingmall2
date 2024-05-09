package org.audioshop.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.EventAttachVO;
import org.audioshop.domain.PageDTO;
import org.audioshop.domain.ReviewAttachVO;
import org.audioshop.domain.ReviewVO;
import org.audioshop.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@RequestMapping("/review/*")
@Controller 
@Log4j
public class ReviewController {

	@Autowired
	private ReviewService service;
	  
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {

		model.addAttribute("list",service.getListAudio(cri)); 
		int total = service.getTotal(cri); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		
	}
	  
	@GetMapping("/listOnly")
	public void listOnly(Criteria cri,Model model, @RequestParam("auId") Long auId) {
 
		model.addAttribute("list",service.getListAudioOnly(auId, cri)); 
		int total = service.getTotal(cri); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		
	}


	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(ReviewVO review, RedirectAttributes rttr) {
		  
		if(review.getAttachList() != null) {
			review.getAttachList().forEach(attach -> log.info(attach));
		}
		 
		service.register(review);
		  
		rttr.addFlashAttribute("result",review.getRvId());
		
		return "redirect:/review/list";
		
	} 
 
	@GetMapping({"/get","/modify"}) 
	public void get( @RequestParam("rvId") Long rvId, @ModelAttribute("cri") Criteria cri, Model model) {
		 
		//model.addAttribute("review",service.get(rvId));
		model.addAttribute("review",service.getOnly(rvId));
	}
 
	@PostMapping("/modify")
	public String modify(ReviewVO review, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	
		if(service.modify(review)) { 
			rttr.addFlashAttribute("result","success");
		}
		 
		return "redirect:/review/list" + cri.getListLink();
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/remove")
	public String remove( @RequestParam("rvId") Long rvId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String username) {
	 
		if(service.remove(rvId)) { 
			rttr.addFlashAttribute("result","success");
		}

		List<ReviewAttachVO> attachList = service.getAttachList(rvId);
		 
		deleteFiles(attachList);
		 
		return "redirect:/review/list" + cri.getListLink();
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	 
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ReviewAttachVO>> getAttachList(Long rvId){ 
		return new ResponseEntity<>(service.getAttachList(rvId),HttpStatus.OK);
	}
	 
	private void deleteFiles(List<ReviewAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		 
		attachList.forEach(attach -> {
			
			try { 
				Path file = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				 
				Files.deleteIfExists(file);
				 
				if(Files.probeContentType(file).startsWith("image")) { 
					Path thumbNail = Paths.get("c:\\upload" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					 
					Files.delete(thumbNail);
				} 
			}catch(Exception e) {
				e.printStackTrace();
			}
		});
	}

}
