package com.hustar.mentoring.login.domain;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDomain {

	private String memberSeq;
	
	@NotNull
	private String memberEmail;
	
	@NotNull
	private String memberPw;
	
	@NotNull
	private String memberName;
	
	@NotNull
	private String memberPhoneNumber;
	private String memberSchool;
	private String memberMajor;
	private String memberAddmission;
	private String memberTrack;
	private String authoritie;
}
