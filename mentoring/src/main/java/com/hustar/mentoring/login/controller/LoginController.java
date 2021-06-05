package com.hustar.mentoring.login.controller;

import javax.validation.Valid;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.service.MemberDetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	private final MemberDetailService memberDetailService;
	
	/*
	 *  MemberDetails auth = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); -> 로그인 후 저장된 유저의 정보들을 MemberDetails 객체로 받음
	 *  MemberDetails.get** -> MebmerDetails안에 있는 get 메서드를 사용하여 사용자 이름, 권한, 이메일 등 가져올 수 있음
	 */
	
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String login() {
		return "login";
	}
	
	@PostMapping(value = "/signUp")
	public String signUp(@Valid MemberDomain member) throws Exception {
		memberDetailService.signUp(member);
		return "/login";
	}
	
	@GetMapping("/sign")
	public String sign() {
		return "insert";
	}
	
	@GetMapping("/common")
	public String menti(Authentication auth, MemberDetails memberDetails) {
		System.out.println("auth.getName() : "+auth.getName());
		
		System.out.println("memberDetailsService.findBySeq(auth.getName) : "+memberDetailService.findBySeq(auth.getName()));
		System.out.println("memberDetails.getMemberEmail : "+memberDetails.getMemberEmail());
		System.out.println("memberDetails.getMemberSeq() : "+memberDetails.getMemberSeq());
		return "compelete";
	}
	
	@GetMapping("/menti")
	public String myTest() {
		MemberDetails auth = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(auth.getAuthoritie());
		return "menti";
	}
	
	@GetMapping("/super")
	@ResponseBody
	public String test() {
		MemberDetails auth = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(auth.getAuthoritie());
		return "mento";
	}
}
