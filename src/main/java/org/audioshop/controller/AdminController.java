package org.audioshop.controller;
 
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")	 
@AllArgsConstructor 
public class AdminController {

	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/index", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/admin/index
	public String index() {
	 
	return "/admin/index";

	}
/*
	@GetMapping(value = "/login", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/admin/login
	public String login() {
	 
	return "/admin/login";

	} 

	@GetMapping(value = "/password", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/admin/password
	public String password() {
	 
	return "/admin/password";

	} 

	@GetMapping(value = "/register", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/admin/register
	public String register() {
	 
	return "/admin/register";

	}
*/ 

	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/charts", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/admin/charts
	public String charts() {
	 
	return "/admin/charts";

	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/tables", produces = "text/plain; charset=UTF-8")		// http://localhost:8080/admin/tables
	public String tables() {
	 
	return "/admin/tables";

	}
	
	

	
}
