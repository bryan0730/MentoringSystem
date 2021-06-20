package com.hustar.mentoring.admin.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.admin.service.AdminService;
import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.login.domain.MemberDomain;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

	private final AdminService adminService;
	
	@GetMapping
	public String adminMain() {
		
		return "adminMain";
	}
	
	@GetMapping("/adminEnterprise")
	public String goAdministrateEnterprise(Model model) {
		List<EnterpriseDomain> enterpriseList = adminService.selectEnterpriseList();
		model.addAttribute("list", enterpriseList);
		return "adminEnterprise";
	}
	
	@PostMapping("/modifyEnterprise")
	@ResponseBody
	public void updateEnterprise(
			EnterpriseDomain enterpriseDomain, 
			@RequestParam(value = "imageUpload", required = false) MultipartFile uploadFile) throws Exception {
		
		
		adminService.updateEnterprise(enterpriseDomain, uploadFile);
		
	}
	
	@PostMapping("/deleteEnterprise")
	@ResponseBody
	public void deleteEnterprise(@RequestBody EnterpriseDomain enterpriseDomain) {
		adminService.deleteEnterprise(enterpriseDomain);
	}
	
	@PostMapping("/insertEnterprise")
	public String insertEnterprise(@Valid EnterpriseDomain enterpriseDomain, 
			@RequestParam(value = "imageUpload2", required = false) MultipartFile uploadFile){
		System.out.println(uploadFile);
		adminService.insertEnterprise(enterpriseDomain, uploadFile);
		return "redirect:/admin"; 
	}
	@GetMapping("/matchingPage")
	public String matchingPage(Model model) {
		
		List<MemberDomain> mentoList = (List<MemberDomain>)adminService.selectMentoList();
		List<MemberDomain> mentiList = (List<MemberDomain>)adminService.selectMentiList();
		
		model.addAttribute("mentoList", mentoList);
		model.addAttribute("mentiList", mentiList);
		
		return "adminMatching";
	}
	
	@PostMapping("/matchingProc")
	@ResponseBody
	public void matchingProc(@RequestParam int mentoSeq, @RequestParam(value="mentiSeq[]") List<String> mentiSeq) {
		
		adminService.insertMentoring(mentoSeq, mentiSeq);
		
	}
	
	@GetMapping("/selectMentiList")
	@ResponseBody
	public List<MemberDomain> selectMentiList(@RequestParam int mentoSeq) {
		return adminService.selectMentiListOfMento(mentoSeq);
	}
	
	@PostMapping("/deleteMenti")
	@ResponseBody
	public void deleteMenti(@RequestParam int mentiSeq) {
		adminService.deleteMentoring(mentiSeq);
	}
}
