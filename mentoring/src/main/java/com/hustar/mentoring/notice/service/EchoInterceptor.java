package com.hustar.mentoring.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

import com.hustar.mentoring.EchoService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class EchoInterceptor implements HandlerInterceptor{

	private final EchoService echoService; 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String memberId = SecurityContextHolder.getContext().getAuthentication().getName();
		request.setAttribute("echoList", echoService.selectEchoList(memberId));
		return true;
	}
}
