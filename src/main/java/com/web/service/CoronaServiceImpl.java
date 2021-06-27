package com.web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.CoronaDAO;

@Service("coronaService")
public class CoronaServiceImpl implements CoronaService {

	@Resource(name = "coronaDAO")
	private CoronaDAO coronaDAO;

	@Override
	public int insertCorona(HashMap<String, Object> hMap) {
		return coronaDAO.insertCorona(hMap);
	}

	@Override
	public List<?> selectCorona() {
		return coronaDAO.selectCorona();
	}

	@Override
	public List<?> selectCoronaDate(String date) {
		return coronaDAO.selectCoronaDate(date);
	}

}
