package com.hustar.mentoring.login.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MentiSignUp implements Judgement{

	private final MemberMapper memberMapper;
	
	@Override
	public void insertMemberInfo(MemberDomain memberDomain) {
		memberDomain.setMemberPw(new BCryptPasswordEncoder().encode(memberDomain.getMemberPw()));
		memberMapper.mentiSignUp(memberDomain);
		
	}

}
