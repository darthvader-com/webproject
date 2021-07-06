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

	// 매일 오전 10시부터 5분 간격
	@Scheduled(cron = "0 0/5 10 * * *")
	public void coronaBatch() {
		System.out.println("10시[5분간격] 배치 호출 시점 ㅣ " + dateStr1);
		c.insertCoronaBatch("coronaBatch - 10시(5분간격)");
	}

}
