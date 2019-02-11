package com.utf18.site.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utf18.site.dao.UserDAO;
import com.utf18.site.vo.UserVO;

@Service("userservice")
public class UserService {

	@Autowired
	private UserDAO dao;

	public void insertUser(UserVO vo) {
		dao.insert(vo);
	}

	public UserVO getUserVO(UserVO vo) {
		return dao.getUserVO(vo);
	}

	// 아이디 중복 확인
	public int CheckDuplication(String email) {
		System.out.println("-------------id UserService-------------");
		int idCount = dao.idcheck("checkDuplicationId", email.replace("=", ""));
		// int idCount = dao.idcheck(inputId);
		return idCount;
	}

	// 닉네임 중복확인
	public int CheckNicknameDuplication(String nickname) {
		System.out.println("-------------nickname UserService-------------");
		int nicknameCount = dao.nicknamecheck(nickname.replace("=", ""));
		return nicknameCount;
	}

}
