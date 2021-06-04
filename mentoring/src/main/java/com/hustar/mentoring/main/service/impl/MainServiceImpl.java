package com.hustar.mentoring.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hustar.mentoring.main.domain.BookingDomain;
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
	public void insertBooking(BookingDomain bookingDomain) throws Exception {
		mainMapper.insertBooking(bookingDomain);
	}
	
	@Override
	public void updateBooking(BookingDomain bookingDomain) throws Exception {
		mainMapper.updateBooking(bookingDomain);
	}
	
	@Override
	public void deleteBooking(BookingDomain bookingDomain) throws Exception {
		mainMapper.deleteBooking(bookingDomain);
	}
}
