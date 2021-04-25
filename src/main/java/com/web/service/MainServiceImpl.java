package com.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.MainDAO;
import com.web.model.Tuser;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private SqlSessionTemplate session;

	@Resource(name = "mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<?> selectLogin(Tuser user) {
		return mainDAO.selectLogin(session, user);
	}

}
