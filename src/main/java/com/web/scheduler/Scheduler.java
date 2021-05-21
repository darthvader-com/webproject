package com.web.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.web.controller.MainController;

@Controller
public class Scheduler {
	
	@Autowired
	MainController m;

	// 10초 */10 * * * * *
	@Scheduled(cron = "*/10 * * * * *")
	public void schedulerStatus() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");
		String strDate = sdf.format(new Date());
		System.out.println("[INFO](" + strDate + ")" + "  서버 정상 실행 중");
	}

	// 매시간 정각 0 0 * * * *
	@Scheduled(cron = "0 0 * * * *")
	public void coronaBatch() {
		m.insertCoronaBatch();
	}

}
