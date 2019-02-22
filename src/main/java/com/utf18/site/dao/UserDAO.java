package com.utf18.site.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.CustomBadwordVO;
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

	// 비번 일치하는지 확인
	public String checkPassword(String email) {
		System.out.println("-------------checkPassword UserDAO-------------");
		return mybatis.selectOne("UserDAO.checkPassword", email);
	}

	public String getNickName(String email) {
		return mybatis.selectOne("UserDAO.getNickName", email);
	}
	
	// 사용자 지정 비속어 단어 추가
	   public void addCustomBadword(CustomBadwordVO vo) {
	      System.out.println("-------디에이오---------"+vo.getEmail()+"--------"+vo.getContent()+"----------------");
	      mybatis.insert("UserDAO.addCustomBadword", vo);
	   }

	   // 사용자 지정 비속어 단어 삭제
	   public void deleteCustomBadword(CustomBadwordVO vo) {
	      System.out.println("-------디에이오---------"+vo.getNum()+"--------");
	      mybatis.delete("UserDAO.deleteCustomBadword", vo);      
	   }
	      
	   // 사용자가 추가한 비속어 단어리스트 가져오기
	   public List<CustomBadwordVO> getCustomBadWordList(String email) throws Exception{
	      return mybatis.selectList("UserDAO.getCustomBadWordList", email);
	   }
	   // 사용자 '경고횟수' 설정
	   public void setWarnCount(UserVO vo) {
	      System.out.println("-------디에이오---------" + vo.getManage_warncount() + "--------");
	      mybatis.update("UserDAO.setWarnCount", vo);
	   }

	public int getLimitWarnCount(String email) {
		return mybatis.selectOne("UserDAO.limitWarnCount", email);
	}

	  // 적용 0 => 유저가 작성한 비속어 리스트 채팅에 적용안함
	   public void apply0(String email) {
	      System.out.println("-------디에이오---------" + email + "--------");
	      mybatis.update("UserDAO.apply0", email);      
	   }

	   // 적용 1 => 유저가 작성한 비속어 리스트 채팅에 적용 함
	   public void apply1(String email) {
	      System.out.println("-------디에이오---------" + email + "--------");
	      mybatis.update("UserDAO.apply1", email);      
	   }

	public String getApply(String email) {
		return mybatis.selectOne("UserDAO.getApply", email);
	}

	public void subscribe(UserVO vo) {
		mybatis.update("UserDAO.subscribe", vo);
	}

}
