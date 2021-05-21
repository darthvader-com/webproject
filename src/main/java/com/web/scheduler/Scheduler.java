package com.web.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class Scheduler {

	@Scheduled(cron = "*/10 * * * * *")
	public void schedulerStatus() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");
		String strDate = sdf.format(new Date());
		System.out.println("[" + strDate + "]" + "  서버 정상 실행 중");
	}

}
