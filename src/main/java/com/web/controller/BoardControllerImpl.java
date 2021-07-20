package com.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.MainService;

@Controller
public class BoardControllerImpl implements BoardController {

	@Resource(name = "mainService")
	private MainService ms;

	@Override
	@ResponseBody
	@RequestMapping(value = "/boardAjax.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String boardAjax(HttpServletRequest request, @RequestParam String pwd) {
		List<HashMap<String, String>> tempPwd = ms.getBoardPwd("board");

		if (pwd.equals(tempPwd.get(0).get("PWD"))) {
			return "success";
		} else {
			return "fail";
		}
	}

	@Override
	@RequestMapping(value = "/mboard.do", method = RequestMethod.GET)
	public String mboard() {
		return "mboard";
	}

}
