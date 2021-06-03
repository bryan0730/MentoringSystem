package com.hustar.mentoring.login.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class MemberDetailService implements UserDetailsService{

	private final MemberMapper memberMapper;
	private final SignUpFactory signUpFactory;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDetails member = memberMapper.findByuser(username);
		return member;
	}

	public void signUp(MemberDomain memberDomain) {
		// TODO Auto-generated method stub
		Role param = Role.valueOf(memberDomain.getAuthoritie());
		signUpFactory.getInstance(param).insertMemberInfo(memberDomain);
	}
	
	public int findBySeq(String memberEmail) {
		return memberMapper.findBySeq(memberEmail);
	}

}
