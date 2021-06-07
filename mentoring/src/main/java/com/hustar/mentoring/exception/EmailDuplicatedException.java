package com.hustar.mentoring.exception;

public class EmailDuplicatedException extends SignUpException{
	
	private static final long serialVersionUID = 9060598985232777247L;
	
	public EmailDuplicatedException() {
		super(ErrorCode.DUPLECATED_ERROR);
	}

	

}
