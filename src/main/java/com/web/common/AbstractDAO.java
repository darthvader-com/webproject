package com.web.common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {

	@Autowired
	private SqlSessionTemplate session;

	public int insert(String value, Object object) {
		return session.insert(value, object);
	}

	public int update(String value, Object object) {
		return session.update(value, object);
	}

	public int delete(String value, Object object) {
		return session.delete(value, object);
	}

	public List<Object> selectOne(String value, Object object) {
		return session.selectOne(value, object);
	}

	public List<Object> selectList(String value, Object object) {
		return session.selectList(value, object);
	}

}
