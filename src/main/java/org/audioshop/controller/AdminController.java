package org.audioshop.controller;
 
import java.util.List;

import org.audioshop.domain.AuthVO;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.MemberVO;
import org.audioshop.domain.OrderCancelDTO;
import org.audioshop.domain.OrderDTO;
import org.audioshop.domain.PageDTO;
import org.audioshop.service.AdminService;
import org.audioshop.service.AudioDramaService;
import org.audioshop.service.MemberService;
import org.audioshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")	 
@AllArgsConstructor 
@Log4j
public class AdminController { 
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private AudioDramaService service;

	@Autowired
	private MemberService memberservice;

	
	/* 관리자 메인 페이지 이동 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/index", produces = "text/plain; charset=UTF-8") 
	public String index() {
	 
	return "/admin/index";

	} 
	
	//상품 차트통계 
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/tables", produces = "text/plain; charset=UTF-8") 
	public String tables() {
	 
		return "/admin/tables";

	}
	
	//상품 차트통계 
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/charts", produces = "text/plain; charset=UTF-8") 
	public String charts() {
	 
		return "/admin/charts";

	}
	
	
	/* 상품 관리(상품목록) 페이지 접속 */
	//상품 리스트 출력 
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/audiotables", produces = "text/plain; charset=UTF-8") 
	public String tables(Criteria cri,Model model) throws Exception {
		
		//상품 리스트 데이터 
		//model.addAttribute("list",service.getList(cri));
		List list = service.getList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			//return;
		} 
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.getTotal(cri)));
		
		return "/admin/tables/audiotables";

	} 
	
	//상품 차트통계  
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/audiocharts", produces = "text/plain; charset=UTF-8") 
	public String audiocharts() {
	 
		return "/admin/charts/audiocharts";

	}
	
	
	
	

	
	/* 주문 현황 페이지 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/ordertables")
	public String orderListGET(Criteria cri, Model model) {
		
		List<OrderDTO> list = adminService.getOrderList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		
		return "/admin/tables/ordertables";
	}	
	
	
	/* 주문삭제 */
	@PostMapping("/orderCancel")
	public String orderCanclePOST(OrderCancelDTO dto) {
		
		orderService.orderCancel(dto);
		
		return "redirect:/admin/orderList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum=" + dto.getPageNum();
	}		
	
	
	
	


	/* 회원 관리 페이지 접속 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/membertables")  
	public String authorManageGET(Criteria cri, Model model) throws Exception{
		  
		/* 작가 목록 출력 데이터 */ 
		List list = memberservice.getList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 작가 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
		}
		
		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, memberservice.getTotal(cri))); 

		return "/admin/tables/membertables";
	}	

	//회원 등록 
	@GetMapping(value = "/register", produces = "text/plain; charset=UTF-8") 
	public String register() {
	 
	return "/admin/register";

	} 
	@PostMapping("/register")
	public void register(MemberVO member, AuthVO auth, RedirectAttributes rttr) { 
		 
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setPassword(passwordEncoder.encode(member.getPassword()));  
		memberservice.register(member); 
		rttr.addFlashAttribute("result",member.getMmId());  
		
		//return "redirect:/admin/register"; 
	}

	@GetMapping(value = "/modify", produces = "text/plain; charset=UTF-8") 
	public String modify() {
	 
	return "/admin/modify";

	} 
	
	
	
	
}
