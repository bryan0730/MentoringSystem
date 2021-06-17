package com.hustar.mentoring.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
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
	
	@ExceptionHandler(SignUpException.class)
	protected ResponseEntity<ErrorResponse> duplicatedExceptionHandler(SignUpException e, HttpServletRequest request) {
		log.error("EmailDuplicatedException- url:{}, trace:{}", request.getRequestURI(), e.getStackTrace());
		final ErrorResponse response = new ErrorResponse(e.getErrorCode().getCode(),
				e.getErrorCode().getDescription(),
				"NO");
		
		return new ResponseEntity<ErrorResponse>(response, HttpStatus.OK);
	}
	
	@ExceptionHandler(BindException.class)
	protected ResponseEntity<ErrorResponse> methodArgumentNotValidExceptionHandler(
			BindException e, HttpServletRequest request){
		
		log.error("ValidError- url:{}, trace:{}", request.getRequestURI(), e.getStackTrace());
		
		final ErrorResponse response = makeErrorResponse(e.getBindingResult());
		
		return new ResponseEntity<ErrorResponse>(response, HttpStatus.OK);
	}
	
	private ErrorResponse makeErrorResponse(BindingResult bindingResult) {
		String code = "";
		String description = "";
		String detail = "";
		
		if(bindingResult.hasErrors()) {
			detail = bindingResult.getFieldError().getDefaultMessage();
			String bindResultCode = bindingResult.getFieldError().getCode();
			
			switch (bindResultCode) {
			case "NotNull":
				code = ErrorCode.NOT_NULL.getCode();
				description = ErrorCode.NOT_NULL.getDescription();
				break;

			case "NotBlank":
				code = ErrorCode.NOT_BLANK.getCode();
				description = ErrorCode.NOT_BLANK.getDescription();
				break;
				
			case "Email":
				code = ErrorCode.EMAIL_ERROR.getCode();
				description = ErrorCode.EMAIL_ERROR.getDescription();
				break;
				
			case "Min":
				code = ErrorCode.MIN_ERROR.getCode();
				description = ErrorCode.MIN_ERROR.getDescription();
				break;
			}
		}
		return new ErrorResponse(code, description, detail);
	}
	

	
}
