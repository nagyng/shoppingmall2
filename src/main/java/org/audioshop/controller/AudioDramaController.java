package org.audioshop.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.audioshop.domain.AudioDramaAttachVO;
import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.PageDTO;
import org.audioshop.service.AudioDramaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@CrossOrigin(origins = "*")
@RequestMapping("/audio/*")
@Controller 
@Log4j
public class AudioDramaController {

	@Autowired
	private AudioDramaService service;
	  
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {

		model.addAttribute("list",service.getList(cri));
		 
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}

	
	@CrossOrigin(origins = "<http://localhost:8081>")
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/insert")
	public void insert() {
		
	}

	@CrossOrigin(origins = "<http://localhost:8081>") 
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/insert")
	public String register(AudioDramaVO audio, RedirectAttributes rttr) { 

		log.info(audio);
		
		if(audio.getAttachList() != null) {
			audio.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(audio); 
		
		rttr.addFlashAttribute("result",audio.getAuId()); 
		
		return "redirect:/audio/list"; 
	} 
	
	

	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/get","/modify"}) 
	public void get( @RequestParam("auId") Long auId, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("list",service.getList(cri));
		model.addAttribute("audiodrama",service.get(auId));
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modify(AudioDramaVO audio, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	
		if(service.modify(audio)) { 
			rttr.addFlashAttribute("result","success");
		}
		 
		return "redirect:/audio/list" + cri.getListLink();
	}


	@PreAuthorize("isAuthenticated()")
	@GetMapping("/remove")
	public String remove( @RequestParam("auId") Long auId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String username) {
 

		if(service.remove(auId)) { 
			//게시물 수정후 일회성 속성을 지정
			rttr.addFlashAttribute("result","success");
		}  

		//p581
		//특정 게시물번호에 대한 첨부파일 내역을 변수에 대입
		List<AudioDramaAttachVO> attachList = service.getAttachList(auId); 
		//첨부파일 모두 삭제
		deleteFiles(attachList);
		log.info("정상적으로 삭제!");
		
		return "redirect:/audio/list" + cri.getListLink();
	} 

 
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	

 
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AudioDramaAttachVO>> getAttachList(Long auId){ 
		return new ResponseEntity<>(service.getAttachList(auId),HttpStatus.OK);
	}
	 
	private void deleteFiles(List<AudioDramaAttachVO> attachList) {
		
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
