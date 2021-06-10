package com.hustar.mentoring.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.mypage.config.ProfilImg;
import com.hustar.mentoring.mypage.domain.MyPageDomain;

@Mapper
public interface MyPageMapper {
	
	public List<MemberDomain> mento(@Param("Seq")int memberSeq);

	public MemberDomain mypage(@Param("Seq")int memberSeq);

	public void mypageModify(MemberDomain memberdomain, @Param("Seq")int memberSeq);

	public MemberDomain mypagementi(MemberDomain memberdomain);

	public void mypagePwModify(MemberDomain memberdomain, @Param("Seq")int memberSeq);

}
