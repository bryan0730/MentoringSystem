package com.hustar.mentoring.enterprise.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.enterprise.domain.EnterpriseSearchDomain;
import com.hustar.mentoring.enterprise.service.EnterpriseService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EnterpriseController {

	private final EnterpriseService enterpriseService;
	
	@GetMapping("/enterprise")
	public String goEnterprise(Model model) {
		List<EnterpriseDomain> enterList = enterpriseService.selectEnterpriseList();
		model.addAttribute("enterList", enterList);
		return "enterprise";
	}
	
	@PostMapping("/scroll")
	@ResponseBody
	public List<EnterpriseDomain> scrollDownPost(@RequestBody EnterpriseDomain enterpriseDomain){
		int startSeq = enterpriseDomain.getEnterpriseSeq();
		System.out.println(startSeq);
		return enterpriseService.scrollDownPost(startSeq);
	}
	
	@GetMapping("/enter_search")
	@ResponseBody
	public EnterpriseSearchDomain selectEnterSearchList(EnterpriseSearchDomain enterpriseSearchDomain) {
		System.out.println("locationList : "+ enterpriseSearchDomain.getLocationList());
		return enterpriseSearchDomain;
		
	}
	
}
