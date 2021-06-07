package com.hustar.mentoring.mypage.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.mypage.domain.MyPageDomain;

public interface MyPageService {
	
	public List<MemberDomain> mento(int memberSeq);
	
	public MemberDomain mypage(int memberSeq);

	public void mypageModify(MemberDomain memberdomain,int memberSeq);

	public MemberDomain mypagementi(MemberDomain memberdomain);

}
