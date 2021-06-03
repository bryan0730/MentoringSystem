package com.hustar.mentoring.login.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.service.MemberDetailService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class LoginRestController {

	private final MemberDetailService memberDetailService;
	
	@PostMapping("/emailCheck")
	public Map<String, String> emailCheck(@RequestBody MemberDomain memberDomain) {
		System.out.println(memberDomain.getMemberEmail());
		return memberDetailService.emailCheck(memberDomain);
	}
}
