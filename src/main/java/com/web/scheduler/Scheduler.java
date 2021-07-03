package com.web.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.web.controller.CoronaController;

@Controller
public class Scheduler {

	@Autowired
	CoronaController c;

	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String dateStr1 = sdf1.format(new Date());

	// 매일 오전 10시 10분 간격
	@Scheduled(cron = "0 0/10 10 * * *")
	public void coronaBatch0() {
		System.out.println("10시[10분간격] 배치 호출 시점 ㅣ " + dateStr1);
		c.insertCoronaBatch("batch1(10시[10분간격] 배치)");
	}

//	// 매일 오전 10시
//	@Scheduled(cron = "0 0 10 * * *")
//	public void coronaBatch1() {
//		System.out.println("10시 배치 호출 시점 ㅣ " + dateStr1);
//		c.insertCoronaBatch("batch1(10시 배치)");
//	}
//
//	// 매일 오전 10시 30분
//	@Scheduled(cron = "0 30 10 * * *")
//	public void coronaBatch3() {
//		System.out.println("10시 30분 배치 호출 시점 ㅣ " + dateStr1);
//		c.insertCoronaBatch("batch3(10시 30분 배치)");
//	}
//
//	// 매일 오전 11시
//	@Scheduled(cron = "0 0 11 * * *")
//	public void coronaBatch4() {
//		System.out.println("11시 배치 호출 시점 ㅣ " + dateStr1);
//		c.insertCoronaBatch("batch4(11시 배치)");
//	}

}
