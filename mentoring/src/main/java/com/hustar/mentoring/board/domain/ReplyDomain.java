package com.hustar.mentoring.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyDomain extends SearchDomain{
	private int replySeq;
	private int boardSeq;
	private int mentiSeq;
	private int mentoSeq;
	
	private String replyDate;
	private String replyContent;	
	
	
}
