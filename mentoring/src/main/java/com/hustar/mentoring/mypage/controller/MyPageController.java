package com.hustar.mentoring.mypage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.login.domain.MemberDetails;
import com.hustar.mentoring.login.domain.MemberDomain;
import com.hustar.mentoring.login.service.MemberDetailService;
import com.hustar.mentoring.mypage.config.ProfilImg;
import com.hustar.mentoring.mypage.domain.Intro;
import com.hustar.mentoring.mypage.service.MyPageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyPageController {

	private final MyPageService mypageService;
	private final MemberDetailService memberDetailService;
	
	//index.jsp에서 마이페이지 로고 클릭시 mentomypage/mentimypage 중 어디로 이동할지 결정
	@GetMapping("/chooseMypage")	
	public String chooseMypage(Authentication auth, MemberDetails memberDetails) {
		MemberDetails authentication = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String role = authentication.getAuthoritie();
		
		System.out.println(role);
		
		if(role.equals("ROLE_MEMBER")) {
			
			System.out.println(role);
			
			return "redirect:/mypage";
			
		} else if (role.equals("ROLE_MENTO")){
			
			System.out.println(role);
			
			return "redirect:/mypageMento";
		}
		return null;
	}
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
	
	public String mypage(Model model, HttpServletRequest request, Authentication auth, MemberDomain memberdomain, BoardDomain boarDomain, Intro intro) {
						
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		//작성한 게시글을 가져오기 위한 memberEmail 가져오는 부분
		MemberDetails getData = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberEmail = getData.getMemberEmail();
		//게시글 뿌리는 부분
		List<BoardDomain> board = mypageService.boardList(memberEmail);
		//자소서 뿌리는 부분
		Intro introContents = mypageService.introContents(memberEmail);
		
		MemberDomain mypage = mypageService.mypage(memberSeq);
		
		model.addAttribute("memberSeq", memberSeq);
		
		model.addAttribute("mypage", mypage);
		
		model.addAttribute("board", board);
		
		model.addAttribute("introContents", introContents);
		
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
	
	@GetMapping("/pwUpdateForm")
	public String pwUpdateForm(MemberDomain memberdomain, Model model, Authentication auth) {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		
		MemberDomain mypage = mypageService.mypage(memberSeq);
		
		model.addAttribute("mypage", mypage);
		
		return "mypagePwModify";
	}
	
	//mypageModify에서 정보 수정 후 저장 버튼 눌렀을 때 update 후 마이페이지로 이동
	@PostMapping(value = {"/mypageModify" })
	public String mypageModify(MemberDomain memberdomain, Model model, Authentication auth, FileDomain fileDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		
		int memberSeq = memberDetailService.findBySeq(auth.getName());
		//DB에 저장된 기본 이미지 경로를 가져오는 메서드
		String Photo = mypageService.mypage(memberSeq).getMemberPhoto().toString();
		
		//이미지를 저장하고 memberDomain.memberPhoto에 경로를 저장하기 위한 메서드
		ProfilImg profilImg = new ProfilImg();
		profilImg.UploadProfil(multipartHttpServletRequest, memberdomain, Photo);

		mypageService.mypageModify(memberdomain, memberSeq);	
		//이미지가 저장되는 시간을 줌
		Thread.sleep(2500);

		return "redirect:/mypage";
	}
	
	@GetMapping("/mypagePwModify")
	public String mypagePwModify(MemberDomain memberdomain, Model model, Authentication auth) {
		int memberSeq = memberDetailService.findBySeq(auth.getName());
	
		mypageService.mypagePwModify(memberdomain, memberSeq);
		
		System.out.println("비밀번호 : " + memberdomain.getMemberPw());

				
		return "redirect:/mypage";
	}

	@PostMapping("/introGrowth")
	public String introGrowth(Intro intro) {
		
		MemberDetails getData = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberEmail = getData.getMemberEmail();
		
		mypageService.introGrowth(intro, memberEmail);
		
		return "redirect:/mypage";
	}
	
	@PostMapping("/introPersonality")
	public String introPersonality(Intro intro) {
		
		MemberDetails getData = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberEmail = getData.getMemberEmail();
		
		mypageService.introPersonality(intro, memberEmail);
		
		return "redirect:/mypage";
	}
	
	@PostMapping("/introActivity")
	public String introActivity(Intro intro) {
		
		MemberDetails getData = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberEmail = getData.getMemberEmail();
		
		mypageService.introActivity(intro, memberEmail);
		
		return "redirect:/mypage";
	}
	
	@PostMapping("/introMotive")
	public String introMotive(Intro intro) {
		
		MemberDetails getData = (MemberDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberEmail = getData.getMemberEmail();
		
		mypageService.introMotive(intro, memberEmail);
		
		return "redirect:/mypage";
	}
	
}
