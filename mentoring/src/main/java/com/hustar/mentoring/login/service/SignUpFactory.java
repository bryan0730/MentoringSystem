package com.hustar.mentoring.login.service;

import org.springframework.context.annotation.Configuration;

import com.hustar.mentoring.login.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class SignUpFactory {

	private final MemberMapper memberMapper;
	
	
	public Judgement getInstance(Role role) {
		switch(role) {
			case ROLE_MEMBER : 
				return new MentiSignUp(memberMapper);
				
			case ROLE_MENTO : 
				return new MentoSignUp(memberMapper);
		}
		return null;
	}
}
