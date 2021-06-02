package com.hustar.mentoring.login.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDomain {

	private String memberSeq;
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberPhoneNumber;
	private String memberSchool;
	private String memberMajor;
	private String memberAddmission;
	private String memberTrack;
	private String authorities;
}
