package com.hustar.mentoring.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.main.domain.MainDomain;

@Mapper
public interface MainMapper {

	public List<?> selectBookingList(MainDomain mainDomain);
	public void insertBooking(MainDomain mainDomain);
	public void updateBooking(MainDomain mainDomain);
	public void deleteBooking(MainDomain mainDomain);
}
