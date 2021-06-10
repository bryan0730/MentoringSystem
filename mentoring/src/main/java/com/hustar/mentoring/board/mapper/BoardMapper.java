package com.hustar.mentoring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;
import com.hustar.mentoring.board.domain.ReplyDomain;

@Mapper
public interface BoardMapper {
	// 게시글 List
	public List<?> selectBoardList(BoardDomain boardDomain);
	
	// 게시글 상세 조회
	public BoardDomain selectBoardView(BoardDomain boardDomain);
	
	// 게시글 전체 개수
	public int selectBoardTotalCnt(BoardDomain boardDomain);
	
	// 게시글 등록
	public void insertBoard(BoardDomain boardDomain);
	
	// 게시글 수정
	public void updateBoard(BoardDomain boardDomain);
	
	// 게시글 삭제
	public void deleteBoard(BoardDomain boardDomain);
	
	// 게시글 첨부파일 저장
	public void uploadFile(List<FileDomain> fileList);
	
	// 게시글 첨부파일 조회
	public List<?> selectFileList(int boardSeq);
	
	// 게시글 삭제시 첨부파일 삭제
	public void deleteFiles(int boardSeq);
	
	// 게시글 첨부파일 다운로드 조회
	public FileDomain selectFileDownload (int boardSeq, int fileSeq);
	
	// 게시글 첨부파일 하나씩 삭제
	public void deleteFile(int boardSeq, int fileSeq);
	
	// 댓글 리스트 조회
	public List<ReplyDomain> selectReplyList(int boardSeq);
	
	// 댓글 등록
	public void insertReply(ReplyDomain replyDomain);
	
	// 댓글 수정
	public void updateReply(ReplyDomain replyDomain);
	
	// 댓글 삭제
	public void deleteReply(int replySeq);
}
