package com.hustar.mentoring.main.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.service.MemberDetailService;
import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.service.GetMentoEmail;
import com.hustar.mentoring.main.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MentoringController {
	private final MemberDetailService memberDetailService;
	private final MainService mainService;
	private final GetMentoEmail getMentoEmail;
	
	@RequestMapping(value="/mentoring")
	public String MentoringList(Authentication auth, ModelMap model, BookingDomain bookingDomain) throws Exception {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		MemberDetails authentication = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String role = authentication.getAuthoritie();

		
		Date day = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy", Locale.KOREA);
		String today = dateFormat.format(day);
		
		model.addAttribute("resultList", mainService.beforeMentoringList(memberSeq, role, today));
		model.addAttribute("afterResultList", mainService.afterMentoringList(memberSeq, role, today));
		model.addAttribute("role", role);
		if(role.equals("ROLE_MEMBER")) {			
			String mentoName = getMentoEmail.findByName(memberSeq);
			model.addAttribute("mentoName",mentoName);
		}
		
		return "/main/mentoring";
	}
}
