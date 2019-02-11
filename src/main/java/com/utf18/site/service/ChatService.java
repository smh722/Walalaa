package com.utf18.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.utf18.site.dao.ChatDAO;
import com.utf18.site.vo.ChatLogVO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;

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
//public List<ChatLogVO> getChatLog() {
//	// TODO Auto-generated method stub
//	return chatDAO.getChatLog();
//}

}