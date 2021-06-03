package com.hustar.mentoring.main.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hustar.mentoring.main.domain.MainDomain;
import com.hustar.mentoring.main.mapper.MainMapper;
import com.hustar.mentoring.main.service.MainService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{

	private final MainMapper mainMapper;
	
	@Override
	public List<?> selectBookingList(MainDomain mainDomain) {
		// TODO Auto-generated method stub
		return mainMapper.selectBookingList(mainDomain);
	}
	
	@Override
	public void insertBooking(MainDomain mainDomain) throws Exception {
		mainMapper.insertBooking(mainDomain);
	}
	
	@Override
	public void updateBooking(MainDomain mainDomain) throws Exception {
		mainMapper.updateBooking(mainDomain);
	}
	
	@Override
	public void deleteBooking(MainDomain mainDomain) throws Exception {
		mainMapper.deleteBooking(mainDomain);
	}
}
