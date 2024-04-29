package org.audioshop.controller;

import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.PageDTO;
import org.audioshop.service.AudioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@RequestMapping("/audio/*")
@Controller 
@Log4j
public class AudioController {

	@Autowired
	private AudioService service;
	  
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {

		model.addAttribute("list",service.getList(cri));
		 
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}


	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(AudioDramaVO audio, RedirectAttributes rttr) { 
		service.register(audio); 
		rttr.addFlashAttribute("result",audio.getAuId()); 
		return "redirect:/audio/list"; 
	} 
	 
	@GetMapping({"/get","/modify"}) 
	public void get( @RequestParam("auId") Long auId, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("list",service.getList(cri));
		model.addAttribute("audiodrama",service.get(auId));
	}
 
	@PostMapping("/modify")
	public String modify(AudioDramaVO audio, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	
		if(service.modify(audio)) { 
			rttr.addFlashAttribute("result","success");
		}
		 
		return "redirect:/audio/list" + cri.getListLink();
	}
 
	@PostMapping("/remove")
	public String remove( @RequestParam("auId") Long auId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String username) {
	 
		if(service.remove(auId)) { 
			rttr.addFlashAttribute("result","success");
		}  
		 
		return "redirect:/audio/list" + cri.getListLink();
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	  
	  


}
