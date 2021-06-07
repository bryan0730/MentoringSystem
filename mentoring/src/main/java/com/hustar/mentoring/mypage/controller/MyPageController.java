package com.hustar.mentoring.mypage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.service.MemberDetailService;
import com.hustar.mentoring.mypage.domain.MyPageDomain;
import com.hustar.mentoring.mypage.service.MyPageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyPageController {

	private final MyPageService mypageService;
	private final MemberDetailService memberDetailService;
	
	//멘토 마이페이지 이동
	@GetMapping("/mypageMento")
	public String testSelect(Model model, Authentication auth) {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		List<MemberDomain> mento = mypageService.mento(memberSeq);
		
		model.addAttribute("mento", mento);
		
		return "mypageMento";
	}
	
	//멘티 마이페이지 이동
	@GetMapping("/mypage")
	
	public String mypage(Model model, HttpServletRequest request, Authentication auth, MemberDomain memberdomain) {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		MemberDomain mypage = mypageService.mypage(memberSeq);
		
		model.addAttribute("memberSeq", memberSeq);
		
		model.addAttribute("mypage", mypage);	
		
		return "mypage";
		
		
	}
	
	//멘토 마이페이지에서 특정 학생 마이페이지로 이동
	@GetMapping("/mypageMenti")
	
	public String mypagementi(Model model, HttpServletRequest request, Authentication auth, MemberDomain memberdomain) {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		MemberDomain mypagementi = mypageService.mypagementi(memberdomain);
		
		model.addAttribute("memberSeq", memberSeq);
		
		model.addAttribute("mypage", mypagementi);	
		
		System.out.println("memberSeq : " + memberSeq);
		System.out.println("mypage.memberSeq : " + mypagementi.getMemberSeq());
		
		return "mypage";
		
		
	}
	
	//마이페이지에서 수정 클릭시 mypageModify로 이동
	@GetMapping("/updateForm")
	public String updateForm(MemberDomain memberdomain, Model model, Authentication auth) {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		MemberDomain mypage = mypageService.mypage(memberSeq);
		
		model.addAttribute("mypage", mypage);
		
		return "mypageModify";
	}
	
	//mypageModify에서 정보 수정 후 저장 버튼 눌렀을 때 update 후 마이페이지로 이동
	@PostMapping("/mypageModify")
	public String mypageModify(MemberDomain memberdomain, Model model, Authentication auth) {
		int memberSeq = memberDetailService.findBySeq(auth.getName());
	
		mypageService.mypageModify(memberdomain, memberSeq);

				
		return "redirect:/mypage";
	}
	
}
