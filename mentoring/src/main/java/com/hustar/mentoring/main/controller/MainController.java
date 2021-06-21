package com.hustar.mentoring.main.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hustar.mentoring.EchoDomain;
import com.hustar.mentoring.EchoService;
import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.domain.ScheduleDomain;
import com.hustar.mentoring.main.service.GetMentoEmail;
import com.hustar.mentoring.main.service.MainService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MainController {
	
	protected Log log = LogFactory.getLog(this.getClass());

	private final MainService mainService;
	private final EchoService echoService;
	
	
	@RequestMapping(value="/insertBooking")
	public void BookingInsert(BookingDomain bookingDomain, EchoDomain echoDomain) throws Exception {
		mainService.insertBooking(bookingDomain);
		
		echoDomain.setEchoStatus("reservation");
		echoService.echoInsert(echoDomain);
	}
	
	@RequestMapping(value="/selectBooking")
	public String SelectBooking(BookingDomain bookingDomain) throws Exception {
		String Coment = mainService.selectBooking(bookingDomain);
		return Coment;
	}
	
	@RequestMapping(value="/listBooking")
	public List BookingList(BookingDomain bookingDomain) throws Exception {
		List<BookingDomain> BookingList = (List<BookingDomain>)mainService.selectBookingList(bookingDomain);
		return BookingList;
	}
	
	
	@RequestMapping(value="/updateBooking")
	public void BookingUpdate(BookingDomain bookingDomain) throws Exception {
		mainService.updateBooking(bookingDomain);
	}
	
	@RequestMapping(value="/deleteBooking")
	public void BookingDelete(BookingDomain bookingDomain, ModelMap model) throws Exception {
		mainService.deleteBooking(bookingDomain);
		
		model.addAttribute("resultMsg", "삭제되었습니다");
	}
	
	@RequestMapping(value="/insertComent")
	public void AnswerComent(BookingDomain bookingDomain) throws Exception {
		mainService.answerComent(bookingDomain);
	}
	
	@RequestMapping(value="/getMentoScheduleTime")
	public List ScheduleTime(ScheduleDomain scheduleDomain) throws Exception {
		List<ScheduleDomain> ScheduleTime = (List<ScheduleDomain>)mainService.selectScheduleTime(scheduleDomain);
		return ScheduleTime;
	}
	
	@RequestMapping(value="/insertSchedule")
	public void ScheduleInsert(ScheduleDomain scheduleDomain) throws Exception {
		mainService.insertSchedule(scheduleDomain);
	}
	
	@RequestMapping(value="/listSchedule")
	public List ScheduleList(ScheduleDomain scheduleDomain) throws Exception {
		List<ScheduleDomain> ScheduleList = (List<ScheduleDomain>)mainService.selectScheduleList(scheduleDomain);
		return ScheduleList;
	}
	
	@RequestMapping(value="/updateSchedule")
	public void ScheduleUpdate(ScheduleDomain scheduleDomain) throws Exception {
		mainService.updateSchedule(scheduleDomain);
	}
	
	@RequestMapping(value="/deleteSchedule")
	public void ScheduleDelete(ScheduleDomain scheduleDomain) throws Exception {
		mainService.deleteSchedule(scheduleDomain);
	}
	

}