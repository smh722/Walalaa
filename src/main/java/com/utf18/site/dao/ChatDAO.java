package com.utf18.site.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.utf18.site.dao.ChatDAO;
import com.utf18.site.vo.ChatLogVO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	private String ns = "ChatDAO.";

	public ChatVO checkRoom(String name) throws Exception {
		return mybatis.selectOne(ns + "getRoom", name);
	}

	public ChatVO getChatOwner(String email) throws Exception {
		return mybatis.selectOne(ns + "getChatOwner", email);
	}

	public void createChatRoom(ChatVO vo) throws Exception {
		mybatis.insert(ns + "createChatRoom", vo);
	}

	public List<ChatVO> getRoomList() throws Exception {
		return mybatis.selectList(ns + "getRoomList");
	}

	public void addRoomMember(ChatMemberVO mem) throws Exception {
		mybatis.insert(ns + "addRoomMember", mem);
	}

	public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception {
		return mybatis.selectOne(ns + "getRoomMember", mem);
	}

	public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception {
		return mybatis.selectList(ns + "sameRoomList", mem);
	}

	public void updateRoomMember(ChatMemberVO mem) throws Exception {
		mybatis.update(ns + "updateRoomMember", mem);
	}

	public void deleteRoomMember(ChatMemberVO mem) throws Exception {
		mybatis.delete(ns + "deleteRoomMember", mem);
	}

	public void updateChatCountInc(ChatVO vo) throws Exception {
		mybatis.update(ns + "updateChatCountInc", vo);
	}

	public void updateChatCountDec(ChatVO vo) throws Exception {
		mybatis.update(ns + "updateChatCountDec", vo);
	}

	public void deleteChat() throws Exception {
		mybatis.delete(ns + "deleteChat");
	}

	public List<ChatVO> searchRoomList(String name) throws Exception {
		return mybatis.selectList(ns + "searchRoomList", name);
	}

	public ChatVO getRoomInfo(String name) {
		return mybatis.selectOne(ns + "getRoomInfo", name);
	}

	public void addChatLog(ChatLogVO vo) throws Exception {
		mybatis.insert(ns + "addChatLog", vo);
	}

	public List<ChatLogVO> getChatLog(int num) {
		return mybatis.selectList(ns + "getChatLog", num);
	}

	public String getFilterword(String name) {
		return mybatis.selectOne(ns + "getFilterword", name);
	}
	
	public void plusWarningCount(String name) {
		mybatis.update(ns + "plusWarningCount", name);
	}
	
	public int getWarningCount(String id) {
		return mybatis.selectOne(ns + "getWarningCount", id);
	}
	
	public void updateChatStatus(String id) {
		mybatis.update(ns + "updateChatStatus", id);
	}
	
	public String getChatStatus(String id) {
		return mybatis.selectOne(ns + "getChatStatus", id);
	}
	
	public void updateBadwordStatus(String id) {
		mybatis.update(ns + "updateBadwordStatus", id);
	}
	public String getTime() {
		return mybatis.selectOne(ns + "getTime");
	}
}