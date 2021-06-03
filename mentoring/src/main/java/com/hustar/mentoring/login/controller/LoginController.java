package com.hustar.mentoring.login.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.service.MemberDetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	private final MemberDetailService memberDetailService;
	
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String login() {
		return "login";
	}
	
	@PostMapping(value = "/signUp")
	public String signUp(MemberDomain member) throws Exception {
		memberDetailService.signUp(member);
		return "/login";
	}
	
	@GetMapping("/sign")
	public String sign() {
		return "insert";
	}
	
	@GetMapping("/menti")
	public String menti(Authentication auth, MemberDetails memberDetails, Model model) {
		System.out.println("auth.getName() : "+auth.getName());
		
		System.out.println("memberDetailsService.findBySeq(auth.getName) : "+memberDetailService.findBySeq(auth.getName()));
		System.out.println("memberDetails.getMemberEmail : "+memberDetails.getMemberEmail());
		System.out.println("memberDetails.getMemberSeq() : "+memberDetails.getMemberSeq());
		
		int mentiSeq = memberDetailService.findBySeq(auth.getName());
		model.addAttribute("mentiSeq", mentiSeq);
		return "/main/index";
	}
}
