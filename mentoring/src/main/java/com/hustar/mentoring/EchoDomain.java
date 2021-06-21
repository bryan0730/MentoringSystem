package com.hustar.mentoring;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EchoDomain {

	private int echoSeq;
	private String receiverId;
	private String senderId;
	private String echoMsg;
	private String echoStatus;
}
