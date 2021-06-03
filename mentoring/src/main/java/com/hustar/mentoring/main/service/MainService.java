package com.hustar.mentoring.main.service;

import java.util.List;

import com.hustar.mentoring.main.domain.MainDomain;

public interface MainService {
	public List<?> selectBookingList(MainDomain mainDomain) throws Exception;
	public void insertBooking(MainDomain mainDomain) throws Exception;
	public void updateBooking(MainDomain mainDomain) throws Exception;
	public void deleteBooking(MainDomain mainDomain) throws Exception;
}
