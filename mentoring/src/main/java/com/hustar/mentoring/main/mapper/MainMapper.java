package com.hustar.mentoring.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.main.domain.BookingDomain;

@Mapper
public interface MainMapper {

	public List<?> selectBookingList(BookingDomain bookingDomain);
	public void insertBooking(BookingDomain bookingDomain);
	public void updateBooking(BookingDomain bookingDomain);
	public void deleteBooking(BookingDomain bookingDomain);
}
