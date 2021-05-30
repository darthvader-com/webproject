package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageControllerImpl implements PageController{

	// 회원가입 페이지 이동
	@Override
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}

}
