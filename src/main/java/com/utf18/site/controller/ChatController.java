package com.utf18.site.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.utf18.site.service.ChatService;
import com.utf18.site.vo.ChatLogVO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	ChatService chatService;

	// 전체채팅룸으로 이동
	@RequestMapping(value = "chat.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chat(Model model, HttpServletRequest req, HttpSession session) throws Exception {

		logger.info("chat.do RUN! / Run Time: " + new Date());

		UserVO login = (UserVO) session.getAttribute("login");

		if (login == null) {
			return "redirect:/loginform.do";
		}

		// DB에 현재 아이디로 어떤 방에 들어가있는지 조사 후, 세팅하기
		ChatMemberVO chatM = chatService.getRoomMember(new ChatMemberVO(0, login.getEmail(), "", ""));

		// 만약 채팅방을 처음 입장하는 것이라면 방에대한 아이디정보를 생성
		if (chatM == null) {
			chatService.addRoomMember(new ChatMemberVO(0, login.getEmail(), "all", "all"));

			// 추가를 한다음 chatM을 다시 받아오도록한다.
			chatM = chatService.getRoomMember(new ChatMemberVO(0, login.getEmail(), "", ""));
			logger.info("아이디 정보 추가 성공!" + new Date());

		}
		// 존재한다면 방정보를 all로 변경
		else {
			chatService.updateRoomMember(new ChatMemberVO(0, login.getEmail(), "all", "")); // room 변경

		}

		// 현재 방이름 넣기(전체채팅방이니 all)
		model.addAttribute("room", "all");

		return "chat";
	}

	@ResponseBody
	@RequestMapping(value = "getRoomList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<ChatVO> getRoomList() throws Exception {
		List<ChatVO> RoomList = chatService.getRoomList();
		return RoomList;
	}

	// 방만들기
	@RequestMapping(value = "createChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String createChatRoom(Model model, HttpServletRequest req, ChatVO chat) throws Exception {

		logger.info("createChatRoom.do RUN! / Run Time: " + new Date());

		UserVO login = (UserVO) req.getSession().getAttribute("login");

		if (login == null) {
			return "redirect:/loginform.do";
		}

		logger.info(chat.toString());

		// 해당 정보로 방을 DB에 생성( 이미 방이 존재한다면 생성하지 않는다 )
		ChatVO VO = chatService.checkRoom(chat.getName());
		
		chat.setOwner(login.getEmail()); // 방생성자 추가하기
		chatService.createChatRoom(chat);
		VO = chatService.getRoomInfo(chat.getName());

		// 생성한 방의 ChatMember 로 등록
		chatService.addRoomMember(new ChatMemberVO(0, login.getEmail(), chat.getName(), ""));
		String num = String.valueOf(VO.getNum());
		// 현재 방이름 넣기
		model.addAttribute("room", chat.getName());
		model.addAttribute("roomNum", num);

		return "broadcast";
	}

	// 중복확인
	@ResponseBody
	@RequestMapping(value = "checkRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int checkRoom(Model model, String name) throws Exception {
		System.out.println("name=" + name);

		ChatVO VO = chatService.checkRoom(name);

		// 중복값이 없을경우
		if (VO == null) {
			return 1;
		} else {
			return 0;
		}
	}

	// 세션아이디랑 방주인이랑 같은 사람인지 확인
	@ResponseBody
	@RequestMapping(value = "getChatOwner.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int getChatOwner(@RequestBody String email) throws Exception {
		System.out.println("email : " + email);

		ChatVO vo = chatService.getChatOwner(email.replace("%40", "@"));

		// 0 이면 방송 중 아님, 0이면 방송 중임
		if (vo == null) {
			return 0;
		} else {
			return 1;
		}
	}

	// 방이동
	@RequestMapping(value = "MoveChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String MoveChatRoom(Model model, HttpServletRequest req, String roomName) throws Exception {

		logger.info("MoveChatRoom.do RUN! / Run Time: " + new Date());

		UserVO login = (UserVO) req.getSession().getAttribute("login");

		if (login == null) {
			return "redirect:/loginform.do";
		}

		logger.info("이동할 방이름 : " + roomName);

		// DB에 현재 아이디로 세팅하기
		chatService.addRoomMember(new ChatMemberVO(0, login.getEmail(), roomName, ""));
		logger.info("아이디 정보 추가 성공!" + new Date());

		// 이동하게 될 방 이름으로 수정
		chatService.updateRoomMember(new ChatMemberVO(0, login.getEmail(), roomName, ""));

		// 접속 끊기 이전방은 수정하지 않음.

		// 방이동 처리
		model.addAttribute("room", roomName);

		return "broadcast";
	}
	@RequestMapping(value = "sendobj.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sendobj(Model model, String msg ) throws Exception {
		//HttpServletRequest req
//		String objlist = (String)req.getParameter("msg");
		String objlist = msg;
		logger.info(objlist+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//		String msgArr[] = objlist.split("B%A%D"); // &/%!로 문자를 잘라서 배열에저장
		model.addAttribute("objlist", objlist);
		return "sendobj";
	}

//	// 방 만들기 (이미지 저장하기) -> 아직 사용 ㄴㄴ
//	@RequestMapping(value = "create.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String CreateChatRoom(Model model, HttpServletRequest req, ChatVO chat) throws Exception {
//
//		// 멀티파트파일 추가 후 VO로부터 업로드 파일 받아오기
//		MultipartFile uploadFile = chat.getUploadFile();
//
//		// 업로드한 파일이 존재하는 경우
//		if (!uploadFile.isEmpty()) {
//			// 파일이름받아오기
//			String fileName = uploadFile.getOriginalFilename();
//			// 업로드한 파일을 지정한 경로에 저장
//			// 경로는 워크스페이스 밑 메타데이터 밑 숨겨진 프로젝트에 업로드해야 바로 나타난다
//			uploadFile.transferTo(new File(
//					"D:/Proj/download/workspace2222/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/chatthumbnail/"
//							+ fileName));
//			chat.setFileName(fileName);
//		}
//		// 업로드한 파일이 없을 경우
//		else {
//			// 파일명이 없음
//			chat.setFileName("");
//		}
//
//		return null;
//	}

	@ResponseBody
	@RequestMapping(value = "getChatLog.do", method = {RequestMethod.POST })
	public List<ChatLogVO> getChatLog(@RequestBody int num){
		List<ChatLogVO> logList = chatService.getChatLog(num);
		return logList;
	}
	
	@ResponseBody
	@RequestMapping(value = "getWarnCnt.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int getWarnCnt(@RequestBody String id) throws Exception{
		id = id.replace("%40", "@");
		id = id.replace("=", "");
		int warnCnt = chatService.getWarningCount(id);
		
		if(warnCnt == 3) {
			chatService.updateChatStatus(id);
			String sts = chatService.getChatStatus(id);
			logger.info("ㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗ" + sts);
		}
		
		return warnCnt;
	}
	
	
}
