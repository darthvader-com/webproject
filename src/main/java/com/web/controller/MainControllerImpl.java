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
import org.springframework.web.bind.annotation.ResponseBody;

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

			// Mail.mailSend("", "테스트발송", "테스트내용");

		} catch (NoSuchAlgorithmException e) {
			System.err.println(e.getMessage());
		}
		return "pindex";
	}

	// 로그아웃 세션 파기
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			session.invalidate();
		}

		return "pindex";
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

			if (executeRtn > 0) {
				page = "signupsuccess";
			} else
				page = "signupfail";

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return page;
	}

	// 보관함 페이지 이동
	@Override
	@RequestMapping(value = "/inventory.do", method = RequestMethod.GET)
	public String inventory(HttpServletRequest request, @RequestParam HashMap<String, String> hMap) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "needlogin";
		} else {
			List<?> list = mainService.selectInventory(hMap.get("userNo"));
			request.setAttribute("itemList", list);
			return "inventory";
		}
	}


	// 강화하기
	@Override
	@ResponseBody
	@RequestMapping(value = "/enchant.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String enchant(HttpServletRequest request, @RequestParam HashMap<String, String> hMap) {
		int enchantValue = (int) (Math.random() * 100) + 1;
		String resultRtn = "";
		if (1 <= enchantValue && enchantValue <= 50) {
			int executeRtn = mainService.updateEnchant(hMap);
			if (executeRtn > 0) {
				resultRtn = "success";
			}
		} else
			resultRtn = "fail";
		return resultRtn;
	}

	// 주소가져오기 테스트 페이지이동
	@Override
	@RequestMapping(value = "/maddress.do", method = RequestMethod.GET)
	public String maddress() {
		return "maddress";
	}

	// 주소가져오기 DB
	@Override
	@RequestMapping(value = "/findaddress.do", method = RequestMethod.POST)
	public String findaddress(HttpServletRequest request, @RequestParam HashMap<String, String> hMap) {
		String district = hMap.get("address");

		List<?> list = mainService.selectFindaddress(district);

		request.setAttribute("resultAddress", district);
		request.setAttribute("size", list.size());
		request.setAttribute("list", list);

		return "findaddress";
	}

}
