package com.hustar.mentoring.mypage.service.impl;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.mypage.domain.MyPageDomain;
import com.hustar.mentoring.mypage.mapper.MyPageMapper;
import com.hustar.mentoring.mypage.service.MyPageService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService{
	
	private final MyPageMapper myPageMapper;
	
	@Override
	public List<MemberDomain> mento(int memberSeq) {
		
		return myPageMapper.mento(memberSeq);
	}
	
	@Override
	public MemberDomain mypage(int memberSeq) {

		return myPageMapper.mypage(memberSeq);
		
	}
	
	@Override
	public void mypageModify(MemberDomain memberdomain, int memberiSeq) {
		
		memberdomain.setMemberPw(new BCryptPasswordEncoder().encode(memberdomain.getMemberPw()));
		
		myPageMapper.mypageModify(memberdomain,memberiSeq);
	}
	
	@Override
	public MemberDomain mypagementi(MemberDomain memberdomain) {

		return myPageMapper.mypagementi(memberdomain);
		
	}
	
}
