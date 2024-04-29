package org.audioshop.controller;
 
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.EventAttachVO;
import org.audioshop.domain.EventVO;
import org.audioshop.domain.PageDTO;
import org.audioshop.service.EventService; 
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

@RequestMapping("/event/*")
@Controller 
@Log4j
public class EventController {

	@Autowired
	private EventService service;
	  
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {

		model.addAttribute("list",service.getList(cri));
		 
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}


	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(EventVO event, RedirectAttributes rttr) {
		  
		if(event.getAttachList() != null) {
			event.getAttachList().forEach(attach -> log.info(attach));
		}
		 
		service.register(event);
		  
		rttr.addFlashAttribute("result",event.getEvId());
		
		return "redirect:/event/list";
		
	} 
 
	@GetMapping({"/get","/modify"}) 
	public void get( @RequestParam("evId") Long evId, @ModelAttribute("cri") Criteria cri, Model model) {
		 
		model.addAttribute("event",service.get(evId));
	}
 
	@PostMapping("/modify")
	public String modify(EventVO event, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	
		if(service.modify(event)) { 
			rttr.addFlashAttribute("result","success");
		}
		 
		return "redirect:/event/list" + cri.getListLink();
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/remove")
	public String remove( @RequestParam("evId") Long evId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String username) {
	 
		if(service.remove(evId)) { 
			rttr.addFlashAttribute("result","success");
		}
 
		List<EventAttachVO> attachList = service.getAttachList(evId);
		 
		deleteFiles(attachList);
		 
		return "redirect:/event/list" + cri.getListLink();
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	 
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<EventAttachVO>> getAttachList(Long evId){ 
		return new ResponseEntity<>(service.getAttachList(evId),HttpStatus.OK);
	}
	 
	private void deleteFiles(List<EventAttachVO> attachList) {
		
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
