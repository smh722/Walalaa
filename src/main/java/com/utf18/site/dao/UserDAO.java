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
		mybatis.insert("UserDAO.insert", vo);
	}

	public UserVO getUserVO(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserVO", vo);
	}

	// 아이디 중복 확인
	public int idcheck(String string, String replace) {
		System.out.println("-------------id UserDAO-------------");
		System.out.println("UserDAO.idcheck: " + mybatis.selectOne("UserDAO.idcheck", replace));
		return mybatis.selectOne("UserDAO.idcheck", replace);
	}

	// 닉네임 중복 확인
	public int nicknamecheck(String nickname) {
		System.out.println("-------------nickname UserDAO-------------");
		System.out.println("UserDAO.idcheck: " + mybatis.selectOne("UserDAO.nicknamecheck", nickname));
		return mybatis.selectOne("UserDAO.nicknamecheck", nickname);
	}
}
