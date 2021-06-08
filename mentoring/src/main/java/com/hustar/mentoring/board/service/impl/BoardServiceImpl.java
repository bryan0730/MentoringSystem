package com.hustar.mentoring.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.config.BoardFileUtils;
import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.mapper.BoardMapper;
import com.hustar.mentoring.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardMapper boardMapper;

	@Override
	public List<?> selectBoardList(BoardDomain boardDomain) {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList(boardDomain);
	}

	@Override
	public BoardDomain selectBoardView(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		return (BoardDomain) boardMapper.selectBoardView(boardDomain);
	}
	
	@Override
	public int selectBoardTotalCnt(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardTotalCnt(boardDomain);
	}
	
	
	@Override
	public void insertBoard(BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// TODO Auto-generated method stub
		
		// 파일 저장을 위한 메소드 호출
		BoardFileUtils.FileUpload(boardDomain, multipartHttpServletRequest);	
		
		boardMapper.insertBoard(boardDomain);
	}
	
	@Override
	public void updateBoard(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateBoard(boardDomain);
	}

	@Override
	public void deleteBoard(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteBoard(boardDomain);
	}

	

	
}
