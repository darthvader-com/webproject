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

	public int saveSignupgo(SqlSessionTemplate session, Tuser tuser) {
		return session.insert("main.saveSignupgo", tuser);
	}

}
