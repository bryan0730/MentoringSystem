package com.hustar.mentoring.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.domain.ScheduleDomain;
import com.hustar.mentoring.main.mapper.MainMapper;
import com.hustar.mentoring.main.service.MainService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{

	private final MainMapper mainMapper;
	
	@Override
	public List<?> selectBookingList(BookingDomain bookingDomain) {
		// TODO Auto-generated method stub
		return mainMapper.selectBookingList(bookingDomain);
	}
	
	@Override
	public String selectBooking(BookingDomain bookingDomain) {
		// TODO Auto-generated method stub
		return mainMapper.selectBooking(bookingDomain);
	}
	
	@Override
	public void insertBooking(BookingDomain bookingDomain) throws Exception {
		mainMapper.insertBooking(bookingDomain);
	}
	
	@Override
	public void updateBooking(BookingDomain bookingDomain) throws Exception {
		mainMapper.updateBooking(bookingDomain);
	}
	
	@Override
	public void answerComent(BookingDomain bookingDomain) throws Exception {
		mainMapper.answerComent(bookingDomain);
	}
	
	@Override
	public void deleteBooking(BookingDomain bookingDomain) throws Exception {
		mainMapper.deleteBooking(bookingDomain);
	}
	
	@Override
	public List<?> selectScheduleTime(ScheduleDomain scheduleDomain) {
		// TODO Auto-generated method stub
		return mainMapper.selectScheduleTime(scheduleDomain);
	}
	
	@Override
	public void insertSchedule(ScheduleDomain scheduleDomain) throws Exception {
		mainMapper.insertSchedule(scheduleDomain);
	}
	
	@Override
	public List<?> selectScheduleList(ScheduleDomain scheduleDomain) {
		// TODO Auto-generated method stub
		return mainMapper.selectScheduleList(scheduleDomain);
	}
	
	@Override
	public void updateSchedule(ScheduleDomain scheduleDomain) throws Exception {
		mainMapper.updateSchedule(scheduleDomain);
	}
	
	@Override
	public void deleteSchedule(ScheduleDomain scheduleDomain) throws Exception {
		mainMapper.deleteSchedule(scheduleDomain);
	}
	
	@Override
	public List<BookingDomain> beforeMentoringList(int memberSeq, String role, String today) {
		// TODO Auto-generated method stub
		return mainMapper.beforeMentoringList(memberSeq, role, today);
	}
	
	@Override
	public List<BookingDomain> afterMentoringList(int memberSeq, String role, String today) {
		// TODO Auto-generated method stub
		return mainMapper.afterMentoringList(memberSeq, role, today);
	}
	
	
}
