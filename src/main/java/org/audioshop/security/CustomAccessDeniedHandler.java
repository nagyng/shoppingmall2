package org.audioshop.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.audioshop.controller.SecurityController;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
//접근권한이 없는 사용자가 URL 에 접근 시 403 예외 발생하는데
//이를 처리하는 AccessDeniedHandler 인터페이스를 구현된 CustomAccessDeniedHandler 객체를 선언 
public class CustomAccessDeniedHandler implements AccessDeniedHandler {@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// TODO Auto-generated method stub
	
	
	response.sendRedirect("/accessError");
		
	}
	

	

}
//p629		4/1