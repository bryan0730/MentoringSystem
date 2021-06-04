package com.hustar.mentoring.main.service;

import java.util.List;

import com.hustar.mentoring.main.domain.BookingDomain;

public interface MainService {
	public List<?> selectBookingList(BookingDomain bookingDomain) throws Exception;
	public void insertBooking(BookingDomain bookingDomain) throws Exception;
	public void updateBooking(BookingDomain bookingDomain) throws Exception;
	public void deleteBooking(BookingDomain bookingDomain) throws Exception;
}
