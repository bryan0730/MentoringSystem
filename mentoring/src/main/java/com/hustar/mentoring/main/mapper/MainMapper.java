package com.hustar.mentoring.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.domain.ScheduleDomain;

@Mapper
public interface MainMapper {

	public List<?> selectBookingList(BookingDomain bookingDomain);
	public void insertBooking(BookingDomain bookingDomain);
	public void updateBooking(BookingDomain bookingDomain);
	public void deleteBooking(BookingDomain bookingDomain);
	public List<?> selectScheduleTime(ScheduleDomain scheduleDomain);
	public void insertSchedule(ScheduleDomain scheduleDomain);
	public List<?> selectScheduleList(ScheduleDomain scheduleDomain);
}
