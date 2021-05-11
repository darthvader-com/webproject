package com.web.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.common.SHA256;
import com.web.model.Tuser;
import com.web.service.MainService;

@Controller
public class MainControllerImpl implements MainController {

	public MainControllerImpl() {
	}

	@Resource(name = "mainService")
	private MainService mainService;

	// 로그인 세션 생성
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> hMap) {
		try {
			Tuser user = new Tuser();
			user.setUserId(hMap.get("id"));
			user.setUserPwd(SHA256.input(hMap.get("pwd")));

			List<?> list = mainService.selectLogin(user);

			if (list.size() > 0) {
				session = request.getSession();
				session.setAttribute("user", list);
			} else {
				return "loginfail";
			}

		} catch (NoSuchAlgorithmException e) {
			System.err.println(e.getMessage());
		}
		return "redirect:/";
	}

	// 로그아웃 세션 파기
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			session.invalidate();
		}

		return "redirect:/";
	}

	// 회원가입 페이지 이동
	@Override
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}

	// 회원가입
	@Override
	@RequestMapping(value = "/signupgo.do", method = RequestMethod.POST)
	public String signupgo(@RequestParam HashMap<String, String> hMap) {
		
		String page = "";

		Tuser tuser = new Tuser();
		try {
			tuser.setUserId(hMap.get("userId"));
			tuser.setUserPwd(SHA256.input(hMap.get("userPwd")));
			tuser.setUserName(hMap.get("userName"));
			tuser.setEmail(hMap.get("email"));
			
			int executeRtn = mainService.saveSignupgo(tuser);
			
			System.out.println(executeRtn);
			
			if(executeRtn > 0) {
				page = "signupsuccess";
			} else page = "signupfail";
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return page;
	}
	
	// 보관함 페이지 이동
	@Override
	@RequestMapping(value = "/inventory.do", method = RequestMethod.GET)
	public String inventory(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			return "needlogin";
		} else return "inventory";
	}

}
