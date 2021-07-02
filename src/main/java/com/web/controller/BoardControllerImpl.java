package com.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardControllerImpl implements BoardController {

	@Override
	@RequestMapping(value = "/mboard.do", method = RequestMethod.GET)
	public String mboard(HttpServletRequest request, @RequestParam String pwd) {
		if(pwd.equals("0712!")) {
			return "mboard";
		} else {
			request.setAttribute("msg", "비밀번호가 잘못입력되었습니다");
			request.setAttribute("page", "/");
			return "alert";
		}
	}
}
