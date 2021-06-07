package com.hustar.mentoring.login.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hustar.mentoring.exception.EmailDuplicatedException;
import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class MemberDetailService implements UserDetailsService{

	private final MemberMapper memberMapper;
	private final SignUpFactory signUpFactory;
	private final Map<String, String> responseMap = new HashMap<>();
	
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

	public Map<String, String> emailCheck(MemberDomain memberDomain) {
		// TODO Auto-generated method stub
		try {
			System.out.println("이메일 체크 가져온 값 : "+memberMapper.findByuser(memberDomain.getMemberEmail()).getMemberEmail());
			if(memberMapper.findByuser(memberDomain.getMemberEmail()).getMemberEmail() != null) {
				throw new EmailDuplicatedException();
			}
		}catch(NullPointerException e){
			responseMap.put("description", "사용가능한 Email입니다.");
			responseMap.put("detail", "yes");
			return responseMap;
		}
		return responseMap;
	}
	
	@PostConstruct
	public void postConstruct() {
		
		System.out.println(":::::::::::::::::::::::::::::::::::::::::::Bean 생성시 실행:::::::::::::::::::::::::::::::::::");
	}

	@PreDestroy
	public void preDestory() {
		
		System.out.println(":::::::::::::::::::::::::::::::::::::::::::Bean 소멸시 실행:::::::::::::::::::::::::::::::::::");
	}

}
