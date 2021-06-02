package com.hustar.mentoring.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalHandlerException {

	private Logger log = LoggerFactory.getLogger(GlobalHandlerException.class);
	
	@ExceptionHandler({InternalAuthenticationServiceException.class, AuthenticationServiceException.class})
	protected ResponseEntity<ErrorResponse> notFoundUserExceptionHandler(
			AuthenticationServiceException e, HttpServletRequest request){
		
		log.error("LoginException- url:{}, trace:{}", request.getRequestURI(), e.getStackTrace());
		
		final ErrorResponse response = new ErrorResponse(ErrorCode.AUTH_ERROR.getCode(), ErrorCode.AUTH_ERROR.getDescription(), 
				"errorrrrrrrrrrr");
		
		request.setAttribute("loginFailMsg", ErrorCode.AUTH_ERROR.getDescription());
		
		return  new ResponseEntity<ErrorResponse>(response, HttpStatus.BAD_REQUEST);
	}
	
}
