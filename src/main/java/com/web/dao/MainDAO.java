package com.web.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.common.AbstractDAO;
import com.web.model.Tuser;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {

	public List<?> selectLogin(Tuser user) {
		return selectList("main.selectList", user);
	}

	public int saveSignupgo(Tuser tuser) {
		return insert("main.saveSignupgo", tuser);
	}

	public List<?> selectInventory(String userNo) {
		return selectList("main.selectInventory", userNo);
	}

	public int updateEnchant(HashMap<String, String> hMap) {
		return update("main.updateEnchant", hMap);
	}

}
