package com.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface MainController {

	String login(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			HashMap<String, String> hMap);

	String logout(HttpServletRequest request, HttpServletResponse response);

	String signupgo(HashMap<String, String> hMap);

	String inventory(HttpServletRequest request, HashMap<String, String> hMap);

	String enchant(HttpServletRequest request, HashMap<String, String> hMap);

	String maddress();

	String findaddress(HttpServletRequest request, HashMap<String, String> hMap);

}
