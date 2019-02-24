package com.utf18.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utf18.site.dao.ChatDAO;
import com.utf18.site.vo.ChatLogVO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.ObjectionVO;
import com.utf18.site.vo.UserVO;

@Service
public class ChatService {
	@Autowired
	ChatDAO chatDAO;

	public ChatVO checkRoom(String name) throws Exception {
		return chatDAO.checkRoom(name);
	}

	public ChatVO getChatOwner(String email) throws Exception {
		return chatDAO.getChatOwner(email.replace("=", ""));
	}

	public ChatVO checkChatmember(String email) throws Exception {
		return chatDAO.checkChatmember(email.replace("=", ""));
	}

	public void createChatRoom(ChatVO vo) throws Exception {
		chatDAO.createChatRoom(vo);
	}

	public List<ChatVO> getRoomList() throws Exception {
		return chatDAO.getRoomList();
	}

	public void addRoomMember(ChatMemberVO mem) throws Exception {
		chatDAO.addRoomMember(mem);
	}

	public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception {
		return chatDAO.getRoomMember(mem);
	}

	public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception {
		return chatDAO.sameRoomList(mem);
	}

	public void updateRoomMember(ChatMemberVO mem) throws Exception {
		chatDAO.updateRoomMember(mem);
	}

	public void deleteRoomMember(ChatMemberVO mem) throws Exception {
		chatDAO.deleteRoomMember(mem);
	}

	public void updateChatCountInc(ChatVO vo) throws Exception {
		chatDAO.updateChatCountInc(vo);
	}

	public void updateChatCountDec(ChatVO vo) throws Exception {
		chatDAO.updateChatCountDec(vo);
	}

	public void deleteChat() throws Exception {
		chatDAO.deleteChat();
	}

	public List<ChatVO> searchRoomList(String name) throws Exception {
		return chatDAO.searchRoomList(name);
	}

	public ChatVO getRoomInfo(String name) throws Exception {
		return chatDAO.getRoomInfo(name);
	}

	public void addChatLog(ChatLogVO vo) throws Exception {
		chatDAO.addChatLog(vo);
	}

	public List<ChatLogVO> getChatLog(int num) {
		return chatDAO.getChatLog(num);
	}

	public String getFilterword(String name) {
		return chatDAO.getFilterword(name);
	}

	public void plusWarningCount(String name) {
		chatDAO.plusWarningCount(name);
	}

	public int getWarningCount(String id) {
		return chatDAO.getWarningCount(id);
	}

	public void updateChatStatus(String id) {
		chatDAO.updateChatStatus(id);
	}

	public String getChatStatus(String id) {
		return chatDAO.getChatStatus(id);
	}

	public void updateBadwordStatus(String id) {
		chatDAO.updateBadwordStatus(id);
	}

	public String getTime() {
		return chatDAO.getTime();
	}

	public String replaceLast(String string, String toReplace, String replacement) {
		int pos = string.lastIndexOf(toReplace);
		if (pos > -1) {
			return string.substring(0, pos) + replacement + string.substring(pos + toReplace.length(), string.length());
		} else {
			return string;
		}
	}

	public void insertObj(ObjectionVO vo) {
		chatDAO.insertObj(vo);
	}

	public List<ObjectionVO> getObj(int chatnum) {
		return chatDAO.getObj(chatnum);
	}

	public List<ObjectionVO> getObjList(int chatnum) {
		return chatDAO.getObjList(chatnum);
	}

	public void objAccept(int objnum) {
		chatDAO.objAccept(objnum);
	}

	public void minusWarnCnt(String id) {
		chatDAO.minusWarnCnt(id.replace("=", ""));
	}

	public void returnChatStatus(String id) {
		chatDAO.returnChatStatus(id);
	}

	public void objReject(int objnum) {
		chatDAO.objReject(objnum);
	}

	public String getObjNum(int objnum) {
		return chatDAO.getObjNum(objnum);
	}

	public void uploadChat(ChatVO vo) {
		chatDAO.uploadChat(vo);
	}

	public ChatVO getRoomInfoNumber(int roomNum) {
		return chatDAO.getRoomInfoNumber(roomNum);
	}

	public List<ChatVO> getUploadList() {
		return chatDAO.getUploadList();
	}

	public String getRoomOwner(String name) {
		return chatDAO.getRoomOwner(name);
	}

//public List<ChatLogVO> getChatLog() {
//   // TODO Auto-generated method stub
//   return chatDAO.getChatLog();
//}

	public List<UserVO> getCnnctPPL(int num) {
		return chatDAO.getCnnctPPL(num);
	}

	public UserVO getUsersInfo(String email) {
		return chatDAO.getUsersInfo(email);
	}

	public void updateBlackList(UserVO vo) {
		chatDAO.updateBlackList(vo);
	}

	public void updateOperList(UserVO vo) {
		chatDAO.updateOperList(vo);
	}

	public void incViews(String roomName) {
		chatDAO.incViews(roomName);
	}
	 // 검색 기능
	   public List<ChatVO> getTagList(String tag) {
	      System.out.println("                                            서비스 ############### "+tag);
	      return chatDAO.getTagList(tag);
	   }


}