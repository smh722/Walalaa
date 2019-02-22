package com.utf18.site.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utf18.site.dao.UserDAO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.CustomBadwordVO;
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

	// 비번 일치하는지 확인
	public String checkPassword(String email) {
		System.out.println("-------------checkPassword UserService-------------");
		String db_password = dao.checkPassword(email.replace("=", ""));
		System.out.println("db_password =" + db_password);
		return db_password;
	}

	public String getNickName(String owner) {
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+owner);
		return dao.getNickName(owner);
	}
	
	 // 사용자 지정 비속어 단어 추가
	   public void addCustomBadword(CustomBadwordVO vo) {
	      System.out.println("-------서비스---------"+vo.getEmail()+"--------"+vo.getContent()+"----------------");
	      dao.addCustomBadword(vo);
	   }
	   
	   // 사용자 지정 비속어 단어 삭제
	   public void deleteCustomBadword(CustomBadwordVO vo) {
	      System.out.println("-------서비스---------"+vo.getNum()+"--------");
	      dao.deleteCustomBadword(vo);      
	   }
	   
	   // 사용자가 추가한 비속어 단어리스트 가져오기
	   public List<CustomBadwordVO> getWordList(String email) throws Exception  {
	      return dao.getCustomBadWordList(email);
	   }

	   // 사용자 '경고횟수' 설정
	   public void setWarnCount(UserVO vo) {
	      System.out.println("-------서비스---------" + vo.getManage_warncount() + "--------");
	      dao.setWarnCount(vo);
	   }

	public int getLimitWarnCount(String email) {
		return dao.getLimitWarnCount(email);
	}
	
	 // 적용 0 => 유저가 작성한 비속어 리스트 채팅에 적용안함
	   public void apply0(String email) {
	      System.out.println("-------서비스---------" + email + "--------");
	      dao.apply0(email);
	   }
	   
	   // 적용 1 => 유저가 작성한 비속어 리스트 채팅에 적용 함
	   public void apply1(String email) {
	      System.out.println("-------서비스---------" + email + "--------");
	      dao.apply1(email);
	   }

	public String getApply(String email) {
		return dao.getApply(email);
	}

	public void subscribe(UserVO vo) {
		dao.subscribe(vo);
	}



}
