package com.hustar.mentoring.login.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDomain {

	private String memberSeq;
	
	@NotEmpty
	@Email
	private String memberEmail;
	
	@NotEmpty
	private String memberPw;
	
	@NotEmpty
	private String memberName;
	
	@NotEmpty
	private String memberPhoneNumber;
	private String memberSchool;
	private String memberMajor;
	private String memberAddmission;
	private String memberTrack;
	
	@NotEmpty
	private String authoritie;
	
}
