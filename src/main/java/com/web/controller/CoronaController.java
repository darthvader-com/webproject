package com.web.controller;

import javax.servlet.http.HttpServletRequest;

public interface CoronaController {

	String corona(HttpServletRequest request);

	String insertCoronaBatch();

	String coronaData(HttpServletRequest request, String value);

	String pindex(HttpServletRequest request);

	String mindex(HttpServletRequest request);

	String getcorona(HttpServletRequest request, String value);

}
