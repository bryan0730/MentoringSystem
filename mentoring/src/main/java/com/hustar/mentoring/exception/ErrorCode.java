package com.hustar.mentoring.exception;

import lombok.Getter;

public enum ErrorCode {
	
	//valid exception
	NOT_NULL("ERROR_001","NOT NULL")
	, NOT_BLANK("ERROR_002","NOT BLANK")
	, EMAIL_ERROR("ERROR_003","EMAIL ERRROR")
	, MAX_ERROR("ERROR_004", "MAX VALUSE")
	, MIN_ERROR("ERROR_005", "MIN VALUSE")
	
	//sql exception
	, SQL_ERROR("ERROR_006", "SQL EXCEPTION")
	
	//custom value exception
	, AUTHNO_VALUE("ERROR_007", "AUTHNO NOTHING")
	, KIND_VALUE("ERROR_008", "KIND NOTHING")
	
	, AUTH_ERROR("ERROR_LOGIN", "찾을 수 없는 사용자입니다.")
	;
	
	@Getter
	private String code;
	
	@Getter
	private String description;
	
	ErrorCode(String code, String description){
		this.code = code;
		this.description = description;
	}
}
