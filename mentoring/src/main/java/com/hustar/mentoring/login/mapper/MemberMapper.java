package com.hustar.mentoring.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.domain.MemberDomain;

@Mapper
public interface MemberMapper {

	public MemberDetails findByuser(String username);

	public void signUp(MemberDomain member);

	public int findBySeq(String memberEmail);

	public void mentiSignUp(MemberDomain memberDomain);

	public void mentoSignUp(MemberDomain memberDomain);

	
}
