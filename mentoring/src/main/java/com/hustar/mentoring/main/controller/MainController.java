package com.hustar.mentoring.main.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hustar.mentoring.main.domain.MainDomain;
import com.hustar.mentoring.main.service.MainService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MainController {
	
	protected Log log = LogFactory.getLog(this.getClass());

	private final MainService mainService;
	
	@RequestMapping(value="/insertBooking")
	public void BookingInsert(MainDomain mainDomain) throws Exception {
		mainService.insertBooking(mainDomain);
	}
	
	@RequestMapping(value="/listBooking")
	public List BookingList(MainDomain mainDomain) throws Exception {
		List<MainDomain> BookingList = (List<MainDomain>)mainService.selectBookingList(mainDomain);
		return BookingList;
	}
	
	@RequestMapping(value="/updateBooking")
	public void BookingUpdate(MainDomain mainDomain) throws Exception {
		mainService.updateBooking(mainDomain);
	}
	
	@RequestMapping(value="/deleteBooking")
	public void BookingDelete(MainDomain mainDomain) throws Exception {
		mainService.deleteBooking(mainDomain);
	}
}
