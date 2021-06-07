package com.hustar.mentoring.login.service.impl;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.mapper.MemberMapper;
import com.hustar.mentoring.login.service.Judgement;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MentiSignUpImpl implements Judgement{

	private final MemberMapper memberMapper;
	
	@Override
	public void insertMemberInfo(MemberDomain memberDomain) {
		memberDomain.setMemberPw(new BCryptPasswordEncoder().encode(memberDomain.getMemberPw()));
		memberMapper.mentiSignUp(memberDomain);
		
	}

}
