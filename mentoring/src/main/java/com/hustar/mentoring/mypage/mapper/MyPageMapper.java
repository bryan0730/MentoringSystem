package com.hustar.mentoring.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.Authentication;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.mypage.config.ProfilImg;
import com.hustar.mentoring.mypage.controller.MyPageController;
import com.hustar.mentoring.mypage.domain.Intro;

@Mapper
public interface MyPageMapper {
	
	public List<MemberDomain> mento(@Param("Seq")int memberSeq);

	public MemberDomain mypage(@Param("Seq")int memberSeq);

	public void mypageModify(MemberDomain memberdomain, @Param("Seq")int memberSeq);

	public MemberDomain mypagementi(MemberDomain memberdomain);

	public void mypagePwModify(MemberDomain memberdomain, @Param("Seq")int memberSeq);

	public List<BoardDomain> boardList(String memberEmail);
	
	public void introGrowth(Intro intro, @Param("Email")String memberEmail);

	public void introPersonality(Intro intro, @Param("Email")String memberEmail);

	public void introActivity(Intro intro, @Param("Email")String memberEmail);

	public void introMotive(Intro intro, @Param("Email")String memberEmail);

	public Intro introContents(@Param("Email")String memberEmail);

	public void addIntro(@Param("Email")String memberEmail);
}
