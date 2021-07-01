package com.web.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.web.controller.CoronaController;

@Controller
public class Scheduler {

	@Autowired
	CoronaController c;

	// 10초 */10 * * * * *
	//@Scheduled(cron = "*/10 * * * * *")
	/*public void schedulerStatus() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");
		String strDate = sdf.format(new Date());
		System.out.println("[INFO](" + strDate + ")" + "  서버 정상 실행 중");
	}*/

	// 매시간 정각 0 0 * * * *
	//	@Scheduled(cron = "0 0 * * * *")
	//	public void coronaBatch() {
	//		c.insertCoronaBatch();
	//	}

	// 매일 오전 10시
	@Scheduled(cron = "0 0 10 * * *")
	public void coronaBatch1() {
		c.insertCoronaBatch("batch1(10시 배치)");
	}

	// 매일 오전 10시 15분
	@Scheduled(cron = "0 15 10 * * *")
	public void coronaBatch2() {
		c.insertCoronaBatch("batch2(10시 15분 배치)");
	}

	// 매일 오전 10시 30분
	@Scheduled(cron = "0 30 10 * * *")
	public void coronaBatch3() {
		c.insertCoronaBatch("batch3(10시 30분 배치)");
	}

	// 매일 오전 10시 45분
	@Scheduled(cron = "0 45 10 * * *")
	public void coronaBatch4() {
		c.insertCoronaBatch("batch4(10시 45분 배치)");
	}

}
