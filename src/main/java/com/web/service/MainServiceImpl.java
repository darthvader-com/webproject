package com.web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.MainDAO;
import com.web.model.Tuser;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name = "mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<?> selectLogin(Tuser user) {
		return mainDAO.selectLogin(user);
	}

	@Override
	public int saveSignupgo(Tuser tuser) {
		return mainDAO.saveSignupgo(tuser);

	}

	@Override
	public List<?> selectInventory(String userNo) {
		return mainDAO.selectInventory(userNo);
	}

	@Override
	public int updateEnchant(HashMap<String, String> hMap) {
		return mainDAO.updateEnchant(hMap);
	}

	@Override
	public int insertCorona(HashMap<String, Object> hMap) {
		return mainDAO.insertCorona(hMap);
	}

	@Override
	public List<?> selectCorona() {
		return mainDAO.selectCorona();
	}

}
