package com.hustar.mentoring.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.config.PagingCalc;
import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.service.BoardService;
import com.hustar.mentoring.login.service.MemberDetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/common")
@RequiredArgsConstructor
public class BoardController {

	protected Log log = LogFactory.getLog(this.getClass());
	
	private final BoardService boardService;
	private final MemberDetailService memberDetailService;
	
	// 게시글 List
	@GetMapping(value="/BoardList.do")
	public String BoardList(@ModelAttribute("boardDomain") BoardDomain boardDomain,
			ModelMap model) throws Exception {
		
		PagingCalc paging = new PagingCalc();
		
		paging.setTotalCnt(boardService.selectBoardTotalCnt(boardDomain), boardDomain);
		
		List<BoardDomain> boardList = (List<BoardDomain>) boardService.selectBoardList(boardDomain);
		
		model.addAttribute("paging",paging);
		model.addAttribute("select",boardDomain.getPageIndex());
		model.addAttribute("boardList", boardList);
		
		
		
		return "board";
	}
	
	
	// 게시글 조회
	@GetMapping(value="/BoardView.do")
	public String BoardView(@ModelAttribute BoardDomain boardDomain,
			HttpServletRequest req,
			HttpServletResponse res,
			ModelMap model) throws Exception {
			
			BoardDomain BoardView = (BoardDomain) boardService.selectBoardView(boardDomain);
			
			model.addAttribute("BoardView", BoardView);
		
		
		return "view";
	}
	
	
	// 게시글 등록
	@GetMapping(value="/insertBoard.do")
	public String insertBoard(ModelMap model) throws Exception {
		
		model.addAttribute("actionUrl", "/menti/insertBoardForm.do");
		
		return "insertForm";
	}
	
	
	
	// 게시글 등록 처리
	@PostMapping(value="/insertBoardForm.do")
	public String insertBoardForm(@ModelAttribute BoardDomain boardDomain,
			Authentication auth,
			MultipartHttpServletRequest multipartHttpServletRequest,
			HttpServletRequest req,
			ModelMap model) throws Exception {
		
			
		
			/*// 저장 경로 설정
			String UploadPath = req.getSession().getServletContext().getRealPath("/");				
			String ImgUploadPath = UploadPath.substring(0,UploadPath.length()-7).concat("resources" + File.separator + "static" + File.separator + "Board" + File.separator + "ProfileImg");
			
			
			String fileName = null;
			
			
			if (file != null && !(file.getOriginalFilename().equals(""))) {
				// 파일이 있으면 이름을 가져와서 파일 업로드
				fileName = UploadFileUtils.fileUpload(ImgUploadPath, file.getOriginalFilename(), file.getBytes());
			} else {
				// 파일이 없을때 기본화면을 제공해야함
				fileName = "images" + File.separator + "user.png";
			}
			// 파일 경로를 Domain에 set
			boardDomain.setBoardFilePath1(File.separator + "Board" + File.separator + "ProfileImg" + File.separator +  fileName);*/
			
			// DB 저장
			boardService.insertBoard(boardDomain, multipartHttpServletRequest);
				
			return "redirect:BoardList.do";
	}
	
	// 게시글 수정
	@GetMapping(value="/updateBoard.do")
	public String updateBoard(@ModelAttribute BoardDomain boardDomain,
			HttpServletRequest req,
			HttpServletResponse res,
			ModelMap model) throws Exception {
		
			BoardDomain beforeView = (BoardDomain) boardService.selectBoardView(boardDomain);
			model.addAttribute("beforeView", beforeView);
		
			model.addAttribute("actionUrl", "/menti/updateBoardForm.do");
			
		return "insertForm";
	}
	
	
	// 게시글 수정 처리
	@PostMapping(value="/updateBoardForm.do")
	public String updateBoardForm(@ModelAttribute BoardDomain boardDomain,
			@RequestParam(value="hu_img", required = false) MultipartFile file,
			HttpServletRequest req,
			HttpServletResponse res,
			ModelMap model) throws Exception {
		
			String UploadPath = req.getSession().getServletContext().getRealPath("/");				
			String ImgUploadPath = UploadPath.substring(0,UploadPath.length()-7).concat("resources" + File.separator + "static" + File.separator + "Board" + File.separator + "ProfileImg");
			
			
			String fileName = null;
			
			
			if (file != null && !(file.getOriginalFilename().equals(""))) {
				// 파일이 있으면 이름을 가져와서 파일 업로드
				//fileName = FileUtils.fileUpload(ImgUploadPath, file.getOriginalFilename(), file.getBytes());
			} else {
				// 파일이 없을때 기본화면을 제공해야함
				fileName = "images" + File.separator + "user.png";
			}
			// 파일 경로를 Domain에 set
			//boardDomain.setBoardFilePath1(File.separator + "Board" + File.separator + "ProfileImg" + File.separator +  fileName);
			
		
			boardService.updateBoard(boardDomain);
		
		return "redirect:BoardView.do?boardSeq=" + boardDomain.getBoardSeq();
	}
	
	/*
	@PostMapping(value= "/insertBoardForm.do")
	@ResponseBody
	public ResponseEntity<?> insertBoardForm(@ModelAttribute LoginDomain lgDomain,
			@RequestParam(value = "hu_img", required = false) MultipartFile imgField,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		
			
			
			// 저장 경로 설정
			String UploadPath = req.getSession().getServletContext().getRealPath("/");			
			String ImgUploadPath = UploadPath.substring(0,UploadPath.length()-7).concat("resources" + File.separator + "static" + File.separator +"ProfileImg");
			
			
			String fileName = null;
			
			//System.out.println("")
			
			if (imgField != null && !(imgField.getOriginalFilename().equals(""))) {
				// 파일이 있으면 이름을 가져와서 파일 업로드
				fileName = UploadFileUtils.fileUpload(ImgUploadPath, imgField.getOriginalFilename(), imgField.getBytes());
			} else {
				// 파일이 없을때 기본화면을 제공해야함
				fileName = "images" + File.separator + "user.png";
			}
			// 파일 경로를 Domain에 set
			lgDomain.setHu_img_path(File.separator + "ProfileImg" + File.separator +  fileName);
			
			// DB 저장
			loginService.insertBoard(lgDomain);
			
			URI urilocation = new URI ("/BoardList.do");
			
		return ResponseEntity.created(urilocation).body("{}");
	}*/
	
	// 게시글 삭제
	@PostMapping(value= {"/deleteBoard.do"})
	public String deleteBoard(@ModelAttribute BoardDomain boardDomain,
			HttpServletRequest req,
			HttpServletResponse res,
			ModelMap model) throws Exception{
		
			try {
				
				boardService.deleteBoard(boardDomain);
				
			} catch(Exception e) {
				e.printStackTrace();
				
			}
		
		return "redirect:BoardList.do";
	}
	
	// 게시글에서 파일 다운로드
	@GetMapping(value = {"/fileDownload.do"})
	public void FileDownload(@ModelAttribute BoardDomain boardDomain, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String fileName;
		System.out.println("a");
		System.out.println("a : " + boardDomain.getBoardSeq());
		System.out.println("a : " + boardDomain.getBoardContents());
		System.out.println("a : " + boardDomain.getBoardTitle());
		System.out.println("a : " + boardDomain.getBoardFilePath1());
		
		if (boardDomain.getBoardFilePath1() != null) {
			
			String temp = boardDomain.getBoardFilePath1();
			
			
			String ori = temp.substring(53, temp.length());
			fileName = temp.substring(90,temp.length());
			
					 
			System.out.println("b");
			System.out.println("fileName : " + fileName);
			System.out.println("ori : " + ori);
			System.out.println("path : " + boardDomain.getBoardFilePath1());
			
			// 파일을 byte[] 로 변환
			//byte[] files = FileUtils.readFileToByteArray(new File(boardDomain.getBoardFilePath1()));
			byte[] files = Files.readAllBytes(new File(boardDomain.getBoardFilePath1()).toPath());
			
			
			// octet-stream은 모든 경우의 기본값 -> 알려지지 않은 파일 타입은 이 속성을 사용해야 한다.
			        
			
			
			
			//res.setContentType("application/octet-stream");
			res.setContentType( "application/download; UTF-8" );
			res.setContentLength(files.length);
			res.setHeader("Content-Type", "application/x-msdownload");                
			res.setHeader("Content-Transfer-Encoding", "binary;");
			res.setHeader("Pragma", "no-cache;");
			res.setHeader("Expires", "-1;");


			String header = req.getHeader("User-Agent");
			if (header.indexOf("MSIE") > -1) {
				header = "MSIE";
			} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
				header = "Trident";
			} else if (header.indexOf("Chrome") > -1) {
				header = "Chrome";
			} else if (header.indexOf("Opera") > -1) {
				header = "Opera";
			} else {
				header = "Firefox";	
			}
			
			System.out.println("header : " + header);
			
			String browser = header;

			String dispositionPrefix = "attachment; filename=\"";
			String encodedFilename = null;
			
			
			if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
				encodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Firefox")) {
				encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
				encodedFilename = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < fileName.length(); i++) {
					char c = fileName.charAt(i);
					if (c > '~') {
						sb.append(URLEncoder.encode("" + c, "UTF-8"));
					} else {
						sb.append(c);
					}
				}
				encodedFilename = sb.toString();
			} else {
				//throw new RuntimeException("Not supported browser");
				throw new IOException("Not supported browser");
			}
			
			
			System.out.println("encodedFilename : " + encodedFilename);
			
			// content-Disposition의 속성이 attachment;인 경우 다운로드한다.
			// attachment와 다른 속성으로는 inline이 있는데 이 경우 웹페이지 화면에 표시된다.
			res.setHeader("Content-Dispostion", dispositionPrefix + encodedFilename);
			
//			res.setHeader("Content-Dispostion", "=?UTF-8?Q?" + 
//					"attachment; fileName=\"" + URLEncoder.encode(ori, "UTF-8") + "\";");
			
			
			
			
			res.getOutputStream().write(files);
			res.getOutputStream().flush();
			res.getOutputStream().close();
		}
		System.out.println("c");
	}
}
