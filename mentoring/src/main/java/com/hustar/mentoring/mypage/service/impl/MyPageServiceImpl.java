package com.hustar.mentoring.mypage.service.impl;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.mypage.config.ProfilImg;
import com.hustar.mentoring.mypage.controller.MyPageController;
import com.hustar.mentoring.mypage.domain.Intro;
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
		
		myPageMapper.mypageModify(memberdomain,memberiSeq);
	}
	
	@Override
	public MemberDomain mypagementi(MemberDomain memberdomain) {

		return myPageMapper.mypagementi(memberdomain);
		
	}
	
	@Override
	public void mypagePwModify(MemberDomain memberdomain, int memberiSeq) {
		
		memberdomain.setMemberPw(new BCryptPasswordEncoder().encode(memberdomain.getMemberPw()));
		
		myPageMapper.mypagePwModify(memberdomain,memberiSeq);
	}
	
	@Override
	public List<BoardDomain> boardList(String memberEmail) {

		return myPageMapper.boardList(memberEmail);
		
	}
	
	@Override
	public void introGrowth(Intro intro, String memberEmail) {
		
		myPageMapper.introGrowth(intro, memberEmail);
	}
	
	@Override
	public void introPersonality(Intro intro, String memberEmail) {
		
		myPageMapper.introPersonality(intro, memberEmail);
	}
	
	@Override
	public void introActivity(Intro intro, String memberEmail) {
		
		myPageMapper.introActivity(intro, memberEmail);
	}
	
	@Override
	public void introMotive(Intro intro, String memberEmail) {
		
		myPageMapper.introMotive(intro, memberEmail);
	}

	@Override
	public Intro introContents(String memberEmail) {
		
		return myPageMapper.introContents(memberEmail);
	}
	@Override
	public void addIntro(String memberEmail) {
		
		myPageMapper.addIntro(memberEmail);
	}
	
	@Override
	public List<BookingDomain> bookingContents(int memberSeq){
	
		return myPageMapper.bookingContents(memberSeq);
	}
}
