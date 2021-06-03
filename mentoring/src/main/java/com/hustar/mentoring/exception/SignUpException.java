package com.hustar.mentoring.exception;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignUpException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ErrorCode errorCode;
	
	public SignUpException(ErrorCode errorCode) {
		super(errorCode.getDescription());
		this.errorCode = errorCode;
	}

}
