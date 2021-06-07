package com.hustar.mentoring.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.domain.BoardDomain;

public interface BoardService {
	// 게시글 List
	public List<?> selectBoardList(BoardDomain boardDomain) throws Exception;
	
	// 게시글 상세 조회
	public BoardDomain selectBoardView(BoardDomain boardDomain) throws Exception;
	
	// 게시글 전체 개수
	public int selectBoardTotalCnt() throws Exception;
	
	// 게시글 등록
	public void insertBoard(BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	
	// 게시글 수정
	public void updateBoard(BoardDomain boardDomain) throws Exception;
	
	// 게시글 삭제
	public void deleteBoard(BoardDomain boardDomain) throws Exception;
}
