package com.hustar.mentoring.main.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookingDomain {
	private String bookingId;
	private String bookingTitle;
	private String bookingContent;
	private String bookingDate;
	private String bookingTime;
	private String way;
	private int mentiSeq;
	private int accept;
	private String role;
}
