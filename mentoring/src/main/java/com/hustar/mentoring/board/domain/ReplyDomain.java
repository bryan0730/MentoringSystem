package com.hustar.mentoring.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyDomain extends SearchDomain{
	private int replySeq;
	private int boardSeq;
	
	private String memberEmail;
	private String memberName;
	
	private String replyDate;
	private String replyContent;	
	
	
}
