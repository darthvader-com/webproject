package com.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.service.MainService;

@Controller
public class BoardControllerImpl implements BoardController {

	@Resource(name =  "mainService")
	private MainService ms;

	@Override
	@RequestMapping(value = "/mboard.do", method = RequestMethod.GET)
	public String mboard(HttpServletRequest request, @RequestParam String pwd) {
		List<HashMap<String, String>> tempPwd = ms.getBoardPwd("board");

		if(pwd.equals(tempPwd.get(0).get("PWD"))) {
			return "mboard";
		} else {
			request.setAttribute("msg", "비밀번호가 잘못입력되었습니다");
			request.setAttribute("page", "/");
			return "alert";
		}
	}
}
