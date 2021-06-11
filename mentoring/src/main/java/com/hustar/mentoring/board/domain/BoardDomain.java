package com.hustar.mentoring.board.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDomain extends SearchDomain{
	
	// 게시글 번호
	private int boardSeq;
	
	// 제목
	private String boardTitle;
	
	// 내용
	private String boardContents;
	
	// 글쓴이를 알아내기 위한 정보
	private String memberEmail;
	
	// 알아낸 글쓴이를 저장
	private String memberName;
	
	// 생성일
	private String boardCreateDate;
	
	// 수정일
	private String boardModifyDate;
	
	// 첨부 파일 경로
//	private String boardFilePath1;
//	private String boardFilePath2;
//	private String boardFilePath3;	
}
