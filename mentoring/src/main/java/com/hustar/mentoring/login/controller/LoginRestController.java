package com.hustar.mentoring.login.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.service.MemberDetailService;
import com.hustar.mentoring.mypage.service.MyPageService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class LoginRestController {

	private final MemberDetailService memberDetailService;
	private final MyPageService mypageService;
	
	@PostMapping("/emailCheck")
	public Map<String, String> emailCheck(@RequestBody MemberDomain memberDomain) {
		System.out.println(memberDomain.getMemberEmail());
		return memberDetailService.emailCheck(memberDomain);
	}
	
	@PostMapping("/signUp")
	public void signUp(@Valid MemberDomain member) throws Exception {
		memberDetailService.signUp(member);
		String memberEmail = member.getMemberEmail();
		mypageService.addIntro(memberEmail);
	}
}
