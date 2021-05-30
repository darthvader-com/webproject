package com.web.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.common.AbstractDAO;

@Repository("coronaDAO")
public class CoronaDAO extends AbstractDAO {

	public int insertCorona(HashMap<String, Object> hMap) {
		return insert("corona.insertCorona", hMap);
	}

	public List<?> selectCorona() {
		return selectList("corona.selectCorona", null);
	}

}
