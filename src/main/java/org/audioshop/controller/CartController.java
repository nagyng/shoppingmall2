package org.audioshop.controller;
 

import javax.servlet.http.HttpServletRequest;

import org.audioshop.domain.CartDTO;
import org.audioshop.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart/*")	 
@AllArgsConstructor 
public class CartController {

	@Autowired
	private CartService cartService;
	
	/*

	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/cart", produces = "text/plain; charset=UTF-8") 
	public String cart(Model model) {
	 
		return "/cart/cart";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/cart2", produces = "text/plain; charset=UTF-8") 
	public String cartList(@RequestParam("username") String username, Model model) {

		//카트 목록
		model.addAttribute("cartInfo", cartService.getCartList(username));	 
		return "/cart/cart2";
	}
	
	*/
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/cart2", produces = "text/plain; charset=UTF-8") 
	public String cartList(@RequestParam("username") String username, Model model) {

		//카트 목록
		model.addAttribute("cartInfo", cartService.getCartList(username));	 
		return "/cart/cart2";
	}
	
	
	
	
	

	/* 장바구니 추가 */
	/**
	 * 0: 등록 실패
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재 
	 * 
	 */	 
	
	@PostMapping("/add")
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		  
		// 카트 등록 
		//int result = cartService.addCart(cart); 
		//log.info(result);
		System.out.println("cart.username" + cart.getUsername());
		System.out.println("cart.auId" + cart.getAuId());
		System.out.println("cart.auCount" + cart.getAuCount());
		cartService.addCart(cart); 
		
		return "redirect:/cart/" + cart.getUsername();
	}	 

	/* 장바구니 수량 수정 */
	@PostMapping("/update")
	public String updateCartPOST(CartDTO cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/cart/" + cart.getUsername();
		
	}	
	
	/* 장바구니 수량 수정 */
	@PostMapping("/delete")
	public String deleteCartPOST(CartDTO cart) {
		
		cartService.deleteCart(cart.getCaId());
		
		return "redirect:/cart/" + cart.getUsername();
		
	}	
	
	
	
	
	
	
}
