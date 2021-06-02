package com.hustar.mentoring.login.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDomain {

	//멘토 멘티 seq 구분 필요(아직 생각중)
	
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberSchool;
	private String memberMajor;
	private String memberAddmission;
	private String memberTrack;
	private String authorities;
}
