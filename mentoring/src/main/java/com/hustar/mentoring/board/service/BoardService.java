package com.hustar.mentoring.board.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.board.domain.ReplyDomain;

public interface BoardService {
	// 게시글 List
	public List<?> selectBoardList(BoardDomain boardDomain) throws Exception;
	
	// 게시글 상세 조회
	public BoardDomain selectBoardView(BoardDomain boardDomain) throws Exception;
	
	// 게시글 전체 개수
	public int selectBoardTotalCnt(BoardDomain boardDomain) throws Exception;
	
	// 게시글 등록
	public void insertBoard(BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest, Authentication auth) throws Exception;
	
	// 게시글 수정
	public void updateBoard(BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	
	// 게시글 삭제
	public void deleteBoard(BoardDomain boardDomain) throws Exception;
	
	// 게시글 첨부파일 조회
	public List<?> selectFileList(int boardSeq) throws Exception;
	
	// 게시글 첨부파일 다운로드 조회
	public FileDomain selectFileDownload(int boardSeq, int fileSeq) throws Exception;
	
	// 게시글 수정시 첨부파일 삭제
	public void deleteFile(int boardSeq, int fileSeq) throws Exception;
	
	// 댓글 리스트 조회
	public List<ReplyDomain> selectReplyList(int boardSeq) throws Exception;
	
	// 댓글 개수 조회
	public int selectReplyListCnt(int boardSeq) throws Exception;
	
	// 댓글 등록
	public void insertReply(ReplyDomain replyDomain, Authentication auth) throws Exception;
	
	// 댓글 수정
	public void updateReply(ReplyDomain replyDomain) throws Exception;
	
	// 댓글 삭제
	public void deleteReply(int replySeq) throws Exception;
}
