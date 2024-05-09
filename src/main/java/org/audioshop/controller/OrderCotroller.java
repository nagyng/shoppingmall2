package org.audioshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.audioshop.domain.CartDTO;
import org.audioshop.domain.MemberVO;
import org.audioshop.domain.OrderDTO;
import org.audioshop.domain.OrderPageDTO;
import org.audioshop.service.CartService;
import org.audioshop.service.MemberService;
import org.audioshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@RequestMapping("/order/*")
@Controller 
@Log4j
public class OrderCotroller {
	
	//service
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private CartService cartService;
	
	//mapping
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/order", produces = {
	    	MediaType.APPLICATION_XML_VALUE,
	    	MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public String index(OrderPageDTO opd, Model model) { //@RequestParam("username") String username, 
 
		System.out.println("orders : " + opd.getOrders());
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders())); 

		return "/order/order";
	}
   

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/order/enrollOrder")
	public String orderPageGet(MemberVO member, OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);		
		
		orderService.order(od);
		
		//MemberVO member = new MemberVO();
		member.setUsername(od.getUsername());
		
		HttpSession session = request.getSession(); 
//
//		CartDTO dto = new CartDTO();
//		dto.setUsername(od.getUsername());
//		dto.setAuId(od.getAuId()); 
//		cartService.deleteOrderCart(dto);
		
		return "redirect:/";
	}	
	
	
	

}
