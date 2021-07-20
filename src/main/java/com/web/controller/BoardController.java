package com.web.controller;

import javax.servlet.http.HttpServletRequest;

public interface BoardController {

	String boardAjax(HttpServletRequest request, String pwd);

	String mboard();

}
