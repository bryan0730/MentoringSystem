package com.hustar.mentoring.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileDomain {
	
	// 파일 번호(file Table의 Pk)
	private int fileSeq;
	
	// 게시글 번호
	private int boardSeq;
	
	// 파일 저장 path
	private String filePath;
	
	// 파일 이름
	private String fileOriginName;
	
	// 파일 크기
	private long fileSize;
	
	// 파일 ContentType (확장자랑은 조금 다름 > .hwp이면 application/haansofthwp 라고 저장됨)
	private String fileContentType;
}
