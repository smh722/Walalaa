package com.utf18.site.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.utf18.site.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(UserVO vo) {
		mybatis.insert("UserDAO.insert",vo);
	}
	
	public UserVO getUserVO(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserVO", vo);
	}

}
