package com.hustar.mentoring.main.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.service.MemberDetailService;
import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MentoringController {
	private final MemberDetailService memberDetailService;
	private final MainService mainService;
	
	@RequestMapping(value="/mentoring")
	public String MentoringList(Authentication auth, ModelMap model, BookingDomain bookingDomain) throws Exception {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		MemberDetails authentication = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String role = authentication.getAuthoritie();
		System.out.println("=================================================================");
		System.out.println(role);
		
		if("ROLE_MEMBER".equals(role)) {
			System.out.println("============================================================");
			System.out.println(mainService.selectMentoringList(memberSeq)+"====================================");
			model.addAttribute("resultList", mainService.selectMentoringList(memberSeq));
		}
		
		return "/main/mentoring";
	}
}
