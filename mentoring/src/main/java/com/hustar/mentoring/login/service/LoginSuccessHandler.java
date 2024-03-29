package com.hustar.mentoring.login.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hustar.mentoring.login.domain.MemberDetails;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("name", authentication.getName());
		System.out.println("SuccessHandler ::::::: "+ authentication.getName());
		System.out.println("권한 :::::::: "+authentication.getAuthorities());
		String userAuth = authentication.getAuthorities().toString();
		if(userAuth.equals("[ROLE_ADMIN]")) {
			response.sendRedirect("/admin");
		}else {
			response.sendRedirect("/common");
		}
	}

}
