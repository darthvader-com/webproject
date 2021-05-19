package com.web.service;

import java.util.HashMap;
import java.util.List;

import com.web.model.Tuser;

public interface MainService {

	List<?>  selectLogin(Tuser user);

	int saveSignupgo(Tuser tuser);

	List<?> selectInventory(String userNo);

	int updateEnchant(HashMap<String, String> hMap);

}
