package com.hustar.mentoring.login.service;

import org.springframework.context.annotation.Configuration;

import com.hustar.mentoring.login.mapper.MemberMapper;
import com.hustar.mentoring.login.service.impl.MentiSignUpImpl;
import com.hustar.mentoring.login.service.impl.MentoSignUpImpl;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class SignUpFactory {

	private final MemberMapper memberMapper;
	
	
	public Judgement getInstance(Role role) {
		switch(role) {
			case ROLE_MEMBER : 
				return new MentiSignUpImpl(memberMapper);
				
			case ROLE_MENTO : 
				return new MentoSignUpImpl(memberMapper);
		}
		return null;
	}
}
