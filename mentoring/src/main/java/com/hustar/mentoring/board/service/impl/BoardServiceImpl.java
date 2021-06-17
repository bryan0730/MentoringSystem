package com.hustar.mentoring.board.service.impl;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.config.BoardFileUtils;
import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.board.domain.ReplyDomain;
import com.hustar.mentoring.board.mapper.BoardMapper;
import com.hustar.mentoring.board.service.BoardService;
import com.hustar.mentoring.login.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardMapper boardMapper;

	// 게시글 리스트 조회
	@Override
	public List<?> selectBoardList(BoardDomain boardDomain) {
		// TODO Auto-generated method stub
		
		
		return boardMapper.selectBoardList(boardDomain);
	}

	// 게시글 상세 조회
	@Override
	public BoardDomain selectBoardView(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		return (BoardDomain) boardMapper.selectBoardView(boardDomain);
	}
	
	// 게시글 총 개수
	@Override
	public int selectBoardTotalCnt(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardTotalCnt(boardDomain);
	}
	
	
	// 게시글 등록
	@Override
	public void insertBoard(BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest, Authentication auth) throws Exception {
		// TODO Auto-generated method stub
		
		boardDomain.setMemberEmail(auth.getName());
		
		// 게시글 내용 저장
		boardMapper.insertBoard(boardDomain);
		
		// 파일 저장을 위한 메소드 호출
		List<FileDomain> filelist = BoardFileUtils.UploadFile(boardDomain, multipartHttpServletRequest);
		// 파일이 있으면 파일 저장
		if (filelist.isEmpty() == false) {
			boardMapper.uploadFile(filelist);
		}
	}
	
	
	// 게시글 수정
	@Override
	public void updateBoard(BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// TODO Auto-generated method stub
		
		boardMapper.updateBoard(boardDomain);
		
		// 파일 저장을 위한 메소드 호출
		List<FileDomain> filelist = BoardFileUtils.UploadFile(boardDomain, multipartHttpServletRequest);
		// 파일이 있으면 파일 저장
		if (filelist.isEmpty() == false) {
			boardMapper.uploadFile(filelist);
		}
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(BoardDomain boardDomain) throws Exception {
		// TODO Auto-generated method stub
		
		List<FileDomain> deleteList = (List<FileDomain>)boardMapper.selectFileList(boardDomain.getBoardSeq());
		
		int size = deleteList.size();
		
		// 삭제할 파일이 존재하면
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				BoardFileUtils.DeleteFile(deleteList.get(i).getFilePath());
			}
		}
		
		// 게시글 삭제시 첨부파일도 삭제
		boardMapper.deleteFiles(boardDomain.getBoardSeq());
		boardMapper.deleteBoard(boardDomain);
	}

	
	// 게시글 첨부파일 조회
	@Override
	public List<?> selectFileList(int boardSeq) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectFileList(boardSeq);
	}

	
	// 게시글 첨부파일 다운로드
	@Override
	public FileDomain selectFileDownload(int boardSeq, int fileSeq) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectFileDownload(boardSeq, fileSeq);
	}

	
	// 게시글 첨부파일 하나 삭제
	@Override
	public void deleteFile(int boardSeq, int fileSeq) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteFile(boardSeq, fileSeq);
	}
	
	// 댓글 조회
	@Override
	public List<ReplyDomain> selectReplyList(int boardSeq) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectReplyList(boardSeq);
	}
	
	
	@Override
	public int selectReplyListCnt(int boardSeq) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectReplyListCnt(boardSeq);
	}
	
	
	// 댓글 등록
	@Override
	public void insertReply(ReplyDomain replyDomain, Authentication auth) throws Exception {
		// TODO Auto-generated method stub
		
		replyDomain.setMemberEmail(auth.getName());
		
		boardMapper.insertReply(replyDomain);
	}

	
	// 댓글 수정
	@Override
	public void updateReply(ReplyDomain replyDomain) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateReply(replyDomain);
	}

	
	// 댓글 삭제
	@Override
	public void deleteReply(int replySeq) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteReply(replySeq);
	}




	
	

	
	

	

	
}
