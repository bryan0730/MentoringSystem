package com.hustar.mentoring.mypage.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.mypage.config.ProfilImg;
import com.hustar.mentoring.mypage.controller.MyPageController;
import com.hustar.mentoring.mypage.domain.Intro;

public interface MyPageService {
	
	public List<MemberDomain> mento(int memberSeq);
	
	public MemberDomain mypage(int memberSeq);

	public void mypageModify(MemberDomain memberdomain,int memberSeq);

	public MemberDomain mypagementi(MemberDomain memberdomain);

	public void mypagePwModify(MemberDomain memberdomain, int memberSeq);

	public List<BoardDomain> boardList(String memberEmail);

	public void introGrowth(Intro intro, String memberEmail);

	public void introPersonality(Intro intro, String memberEmail);

	public void introActivity(Intro intro, String memberEmail);

	public void introMotive(Intro intro, String memberEmail);

	public Intro introContents(String memberEmail);

	public void addIntro(String memberSeq);




}
