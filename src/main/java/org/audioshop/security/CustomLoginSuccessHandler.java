package org.audioshop.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
 	
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) 
			throws IOException, ServletException {
		 
		List<String> roleNames = new ArrayList<>();
 
		auth.getAuthorities().forEach(authority -> { 
			roleNames.add(authority.getAuthority());
		});
		
		if(roleNames.contains("ROLE_ADMIN")) { 
			response.sendRedirect("/admin/index");
			return;
		} 
		if(roleNames.contains("ROLE_MANAGER")) { 
			response.sendRedirect("/admin/index");
			return;
		} 
		response.sendRedirect("/");
		
	}

}



