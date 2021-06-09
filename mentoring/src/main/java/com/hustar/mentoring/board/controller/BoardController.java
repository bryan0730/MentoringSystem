package com.hustar.mentoring.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
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
import com.hustar.mentoring.board.domain.FileDomain;
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
			List<FileDomain> fileList = (List<FileDomain>) boardService.selectFileList(boardDomain.getBoardSeq());
			
			model.addAttribute("BoardView", BoardView);
			model.addAttribute("fileList",fileList);
		
		
		return "view";
	}
	
	
	// 게시글 등록
	@GetMapping(value="/insertBoard.do")
	public String insertBoard(ModelMap model) throws Exception {
		
		model.addAttribute("actionUrl", "/common/insertBoardForm.do");
		
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
		
			// 원래 있던 내용을 조회해서 model에 추가
			BoardDomain beforeView = (BoardDomain) boardService.selectBoardView(boardDomain);
			model.addAttribute("beforeView", beforeView);
		
			model.addAttribute("actionUrl", "/common/updateBoardForm.do");
			
		return "insertForm";
	}
	
	
	// 게시글 수정 처리
	@PostMapping(value="/updateBoardForm.do")
	public String updateBoardForm(@ModelAttribute BoardDomain boardDomain,
			MultipartHttpServletRequest multipartHttpServletRequest,
			HttpServletResponse res,
			ModelMap model) throws Exception {
		
			
			
			
			
		
			boardService.updateBoard(boardDomain);
		
		return "redirect:BoardView.do?boardSeq=" + boardDomain.getBoardSeq();
	}
	
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
	public void FileDownload(@RequestParam int boardSeq, @RequestParam int fileSeq,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		
			String fileName = "";


			FileDomain fileDomain = (FileDomain) boardService.selectFileDownload(boardSeq, fileSeq);
		
			File DownloadFile = new File(fileDomain.getFilePath());
			
			byte[] files = FileUtils.readFileToByteArray(DownloadFile);
			
			// octet-stream은 모든 경우의 기본값 -> 알려지지 않은 파일 타입은 이 속성을 사용해야 한다.
			res.setHeader("Content-Type", "application/octet-stream");
			res.setContentLength((int)DownloadFile.length());
			res.setHeader("Content-Transfer-Encoding", "binary;");
			res.setHeader("Pragma", "no-cache;");
			res.setHeader("Expires", "-1;");


			// content-Disposition의 속성이 attachment;인 경우 다운로드한다.
			// attachment와 다른 속성으로는 inline이 있는데 이 경우 웹페이지 화면에 표시된다.
			res.setHeader("Content-Disposition",
					String.format("attachment; filename=%s", URLEncoder.encode(fileDomain.getFileOriginName(), "UTF-8")));


			res.getOutputStream().write(files);
			res.getOutputStream().flush();
			res.getOutputStream().close();
		}
}