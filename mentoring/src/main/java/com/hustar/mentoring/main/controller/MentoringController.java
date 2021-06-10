package com.hustar.mentoring.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MentoringController {
	
	@RequestMapping(value="/mentoring")
	public String MentoringList() {
		
		return "/main/mentoring";
	}
}
