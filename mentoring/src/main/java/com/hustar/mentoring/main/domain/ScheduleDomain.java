package com.hustar.mentoring.main.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheduleDomain {
	private int scheduleId;
	private String scheduleTitle;
	private String scheduleDate;
	private String scheduleTime;
	private int mentoSeq;
}
