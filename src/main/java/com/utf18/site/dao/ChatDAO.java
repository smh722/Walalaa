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
import com.utf18.site.vo.ObjectionVO;
import com.utf18.site.vo.UserVO;

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

	public void insertObj(ObjectionVO vo) {
		mybatis.insert(ns + "insertObj", vo);
	}

	public List<ObjectionVO> getObj(int chatnum) {
		return mybatis.selectList(ns + "getObj", chatnum);
	}

	public List<ObjectionVO> getObjList(int chatnum) {
		return mybatis.selectList(ns + "getObjList", chatnum);
	}

	public void objAccept(int objnum) {
		mybatis.update(ns + "objAccept", objnum);
	}

	public void minusWarnCnt(String id) {
		mybatis.update(ns + "minusWarnCnt", id);
	}

	public void returnChatStatus(String id) {
		mybatis.update(ns + "returnChatStatus", id);
	}

	public void objReject(int objnum) {
		mybatis.update(ns + "objReject", objnum);
	}

	public String getObjNum(int objnum) {
		return mybatis.selectOne(ns + "getObjNum", objnum);
	}

	public ChatVO checkChatmember(String id) {
		return mybatis.selectOne(ns + "checkChatmember", id);
	}

	public void uploadChat(ChatVO vo) {
		mybatis.update(ns + "uploadChat", vo);
	}

	public ChatVO getRoomInfoNumber(int roomNum) {
		return mybatis.selectOne(ns + "getRoomInfoNumber", roomNum);
	}

	public List<ChatVO> getUploadList() {
		return mybatis.selectList(ns + "getUploadList");
	}

	public String getRoomOwner(String name) {
		return mybatis.selectOne(ns + "getRoomOwner", name);
	}

	public List<UserVO> getCnnctPPL(int num) {
		return mybatis.selectList(ns + "getCnnctPPL", num);
	}

	public UserVO getUsersInfo(String email) {
		return mybatis.selectOne(ns + "getUsersInfo", email);
	}

	public void updateBlackList(UserVO vo) {
		mybatis.update(ns + "updateBlackList", vo);
	}

	public void updateOperList(UserVO vo) {
		mybatis.update(ns + "updateOperList", vo);
	}

	public void incViews(String name) {
		mybatis.update(ns + "incViews", name);
	}

}