package com.hustar.mentoring.main.service;

import java.util.List;

import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.domain.ScheduleDomain;

public interface MainService {
	public List<?> selectBookingList(BookingDomain bookingDomain) throws Exception;
	public void insertBooking(BookingDomain bookingDomain) throws Exception;
	public void updateBooking(BookingDomain bookingDomain) throws Exception;
	public void deleteBooking(BookingDomain bookingDomain) throws Exception;
	
	public List<?> selectScheduleTime(ScheduleDomain scheduleDomain) throws Exception;
	public void insertSchedule(ScheduleDomain scheduleDomain) throws Exception;
	public List<?> selectScheduleList(ScheduleDomain scheduleDomain) throws Exception;
	public void updateSchedule(ScheduleDomain scheduleDomain) throws Exception;
	public void deleteSchedule(ScheduleDomain scheduleDomain) throws Exception;
	
	public List<BookingDomain> beforeMentoringList(int memberSeq, String role, String today) throws Exception;
	public List<BookingDomain> afterMentoringList(int memberSeq, String role, String today) throws Exception;
}
