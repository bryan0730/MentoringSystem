package com.hustar.mentoring.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.admin.service.AdminService;
import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

	private final AdminService adminService;
	
	@GetMapping
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
	public String insertEnterprise(EnterpriseDomain enterpriseDomain, 
			@RequestParam(value = "imageUpload2", required = false) MultipartFile uploadFile){
		System.out.println(uploadFile);
		adminService.insertEnterprise(enterpriseDomain, uploadFile);
		return "redirect:/admin"; 
	}
	
}
