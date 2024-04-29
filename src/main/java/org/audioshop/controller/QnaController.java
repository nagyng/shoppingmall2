package org.audioshop.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.audioshop.domain.Criteria;
import org.audioshop.domain.PageDTO;
import org.audioshop.domain.QnaAttachVO;
import org.audioshop.domain.QnaVO;
import org.audioshop.service.QnaService;
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

@RequestMapping("/qna/*")
@Controller 
@Log4j
public class QnaController {

	@Autowired
	private QnaService service;
	  
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {

		model.addAttribute("list",service.getList(cri));
		 
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}


	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(QnaVO qna, RedirectAttributes rttr) {
		  
		if(qna.getAttachList() != null) {
			qna.getAttachList().forEach(attach -> log.info(attach));
		}
		 
		service.register(qna);
		 
		rttr.addFlashAttribute("result",qna.getQnId());
		
		return "redirect:/qna/list";
		
	} 
	 
	@GetMapping({"/get","/modify"}) 
	public void get( @RequestParam("qnId") Long qnId, @ModelAttribute("cri") Criteria cri, Model model) {
		 
		model.addAttribute("qna",service.get(qnId));
	}

	@PreAuthorize("principal.username == #qna.username")
	@PostMapping("/modify")
	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	
		if(service.modify(qna)) { 
			rttr.addFlashAttribute("result","success");
		}
		 
		return "redirect:/qna/list" + cri.getListLink();
	}
 
	@PostMapping("/remove")
	public String remove( @RequestParam("qnId") Long qnId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String username) {
	 
		if(service.remove(qnId)) { 
			rttr.addFlashAttribute("result","success");
		}
 
		List<QnaAttachVO> attachList = service.getAttachList(qnId);
		 
		deleteFiles(attachList);
		 
		return "redirect:/qna/list" + cri.getListLink();
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	 
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<QnaAttachVO>> getAttachList(Long qnId){ 
		return new ResponseEntity<>(service.getAttachList(qnId),HttpStatus.OK);
	}
	 
	private void deleteFiles(List<QnaAttachVO> attachList) {
		
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
