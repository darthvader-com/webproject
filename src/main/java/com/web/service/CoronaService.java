package com.web.service;

import java.util.HashMap;
import java.util.List;

public interface CoronaService {

	int insertCorona(HashMap<String, Object> resultMap);

	List<?> selectCorona();

	List<?> selectCoronaDate(String date);

	List<?> selectCoronaData();

	List<?> selectDayCoronaCount();

	List<?> selectDayCoronaCountMax();

}
