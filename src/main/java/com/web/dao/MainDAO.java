package com.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.web.model.Tuser;

@Repository("mainDAO")
public class MainDAO {

	public List<?> selectLogin(SqlSessionTemplate session, Tuser user) {
		return session.selectList("main.selectList", user);
	}

}
