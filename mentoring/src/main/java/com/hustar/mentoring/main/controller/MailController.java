package com.hustar.mentoring.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hustar.mentoring.main.domain.BookingDomain;
import com.hustar.mentoring.main.service.EmailUtil;
import com.hustar.mentoring.main.service.GetMentoEmail;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MailController {
	private final EmailUtil emailUtil;
	
	private final GetMentoEmail getMentoEmail;
	  
	@PostMapping("/sendEmail")
	public void sendEmail(Model model, BookingDomain bookingDomain) {
		
		String mentoEmail = getMentoEmail.findByEmail(bookingDomain.getMentiSeq());
		String mentiName = bookingDomain.getMentiName();
		String mentorinDate = bookingDomain.getBookingDate();
		String mentoringTime = bookingDomain.getBookingTime();
		String mentoringSelect = bookingDomain.getWay();
		String mentoringTitle = bookingDomain.getBookingTitle();
		
		System.out.println("===================================================" + mentoEmail);
		System.out.println("===================================================" + mentoringSelect);
		
		if(mentoringSelect.equals("오프라인")) {
			emailUtil.sendEmail(mentoEmail, mentiName + "님이 "+mentorinDate+"일 "+ mentoringTime+"시에" + " 멘토링을 예약했습니다.", "멘토링 시스템을 확인해 주세요.");
		}else {
			emailUtil.sendEmail(mentoEmail, mentiName + "님이 "+mentoringTitle+ " 에 대한 질문을 남겼습니다.", "멘토링 시스템을 확인해 주세요.");
		}
		
    
	}
	
	@PostMapping("/updateEmail")
	public void updateEmail(Model model, BookingDomain bookingDomain) {
		
		String mentoEmail = getMentoEmail.findByEmail(bookingDomain.getMentiSeq());
		String mentiName = bookingDomain.getMentiName();
		String mentorinDate = bookingDomain.getBookingDate();
		String mentoringTime = bookingDomain.getBookingTime();
		emailUtil.sendEmail(mentoEmail, mentiName + "님이 "+mentorinDate+"일 "+ mentoringTime+"시에" + " 멘토링을 예약했습니다.", "멘토링 시스템을 확인해 주세요.");
    
	}
	
	@PostMapping("/deleteEmail")
	public void deleteEmail(Model model, BookingDomain bookingDomain) {
		
		String mentoEmail = getMentoEmail.findByEmail(bookingDomain.getMentiSeq());
		String mentiName = bookingDomain.getMentiName();
		String mentorinDate = bookingDomain.getBookingDate();
		String mentoringTime = bookingDomain.getBookingTime();
		emailUtil.sendEmail(mentoEmail, mentiName + "님이 "+mentorinDate+"일 "+ mentoringTime+"시" + " 멘토링을 취소하였습니다.", "멘토링 시스템을 확인해 주세요.");
    
	}
}
