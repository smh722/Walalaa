package com.utf18.site.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.utf18.site.service.ChatService;
import com.utf18.site.service.UserService;
import com.utf18.site.vo.ChatLogVO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.CustomBadwordVO;
import com.utf18.site.vo.ObjectionVO;
import com.utf18.site.vo.UserVO;

@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	ChatService chatService;
	@Autowired
	UserService userService;

	@ResponseBody
	@RequestMapping(value = "getRoomList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<ChatVO> getRoomList(Model model) throws Exception {

		List<ChatVO> RoomList = chatService.getRoomList();
		return RoomList;
	}

	@ResponseBody
	@RequestMapping(value = "getUploadList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<ChatVO> getUploadList(Model model) throws Exception {

		List<ChatVO> uploadList = chatService.getUploadList();
		return uploadList;
	}

	// 방만들기
	@RequestMapping(value = "createChatRoom.do", method = { RequestMethod.POST })
	public String createChatRoom(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String encoding = "UTF-8";
		String url = "D:\\utf18_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Walalaa\\assets\\thumbnailfolder\\";
		logger.info("createChatRoom.do RUN! / Run Time: " + new Date());

		UserVO login = (UserVO) request.getSession().getAttribute("login");

		if (login == null) {
			return "redirect:/loginform.do";
		}
		ChatVO chat = new ChatVO();
		MultipartRequest multi = new MultipartRequest(request, url, 5 * 1024 * 1024, encoding,
				new DefaultFileRenamePolicy());
		logger.info(multi.getFilesystemName("thumbnail"));
		chat.setName(multi.getParameter("name"));

		String filter = "";
		if (multi.getParameter("filterword1") != null)
			filter = multi.getParameter("filterword1");
		if (multi.getParameter("filterword2") != null)
			filter += ", " + multi.getParameter("filterword2");
		if (multi.getParameter("filterword3") != null)
			filter += ", " + multi.getParameter("filterword3");
		chat.setFilterword(filter);

		chat.setContent(multi.getParameter("content"));
		chat.setTag(multi.getParameter("tag")); // -------------------태그
		chat.setThumbnail("/assets/thumbnailfolder/" + multi.getFilesystemName("thumbnail"));
		// 해당 정보로 방을 DB에 생성( 이미 방이 존재한다면 생성하지 않는다 )

		chat.setOwner(login.getEmail()); // 방생성자 추가하기

		chatService.createChatRoom(chat);
		ChatVO VO = chatService.getRoomInfo(chat.getName());

		// 생성한 방의 ChatMember 로 등록
		chatService.addRoomMember(new ChatMemberVO(0, login.getEmail(), chat.getName(), ""));
		String num = String.valueOf(VO.getNum());
		// 현재 방이름 넣기
		model.addAttribute("room", chat.getName());
		model.addAttribute("roomNum", num);
		model.addAttribute("roomName", chat.getName());
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
	public String getChatOwner(@RequestBody String email) throws Exception {
		System.out.println("email : " + email);

		ChatVO vo = chatService.getChatOwner(email.replace("%40", "@"));

		// 0 이면 방송 중 아님, 0이면 방송 중임
		if (vo == null) {
			return "0";
		} else {
			return "1";
		}
	}

	// 방송에 참여중인 사람인지 체크
	@ResponseBody
	@RequestMapping(value = "checkChatmember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkChatmember(@RequestBody String email) throws Exception {
		System.out.println("email : " + email);

		ChatVO vo = chatService.checkChatmember(email.replace("%40", "@"));

		// 0 이면 방송 중 아님, 0이면 방송 중임
		if (vo == null) {
			return "0";
		} else {
			return "1";
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
		ChatVO vo = chatService.getRoomInfo(roomName);
		// 방의 조회수 증가
		chatService.incViews(roomName);
		// 방이동 처리
		model.addAttribute("room", roomName);
		model.addAttribute("roomName", roomName);
		model.addAttribute("roomNum", vo.getNum());
		return "broadcast";
	}

	@ResponseBody
	@RequestMapping(value = "getChatLog.do", method = { RequestMethod.POST })
	public List<ChatLogVO> getChatLog(@RequestBody int num) {
		List<ChatLogVO> logList = chatService.getChatLog(num);
		return logList;
	}

	@ResponseBody
	@RequestMapping(value = "getWarnCnt.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Integer> getWarnCnt(@RequestBody String id) throws Exception {
		id = id.replace("%40", "@");
		id = id.replace("=", "");
		int warnCnt = chatService.getWarningCount(id);
		// id - > 방이름 - > 주인 - > limit
		ChatMemberVO mem = new ChatMemberVO();
		mem.setId(id);
		mem = chatService.getRoomMember(mem);
		String owner = chatService.getRoomOwner(mem.getRoom());
		int limitCnt = userService.getLimitWarnCount(owner);
		if (warnCnt == 3) {
			chatService.updateChatStatus(id);
		}
		List<Integer> warnlist = new ArrayList<>();
		warnlist.add(warnCnt);
		warnlist.add(limitCnt);
		return warnlist;
	}

	@ResponseBody
	@RequestMapping(value = "/getremainCnt.do", method = RequestMethod.POST)
	public int getremainCnt(@RequestParam(name = "num", required = true) int num) throws Exception {
		ChatVO vo = chatService.getRoomInfoNumber(num);

		System.out.println(vo.getRemaincount());

		return vo.getRemaincount();
	}

	@ResponseBody
	@RequestMapping(value = "/ownerCheck.do", method = RequestMethod.POST)
	public boolean ownerCheck(@RequestBody String id) throws Exception {
		boolean check = false;
		id = id.replace("%40", "@");
		id = id.replace("=", "");
		ChatMemberVO mem = new ChatMemberVO();
		mem.setId(id);
		mem = chatService.getRoomMember(mem);
		String owner = chatService.getRoomOwner(mem.getRoom());
		if (owner.equals(id)) {
			check = true;
		}

		return check;
	}

	@RequestMapping(value = "sendobj.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sendobj(Model model, String msg) throws Exception {

		String objlist[] = msg.split("/");
		ArrayList<String> newobjlist = new ArrayList<>();
		for (int i = 0; i < objlist.length; i++) {
			String msgArr[] = new String[2];
			msgArr = chatService.replaceLast(objlist[i], ":", "").split(":");
			ChatMemberVO memVO = chatService.getRoomMember(new ChatMemberVO(0, msgArr[0], "", "")); // ID를 통해 방이름 가져오기
			ChatVO chatVO = chatService.getRoomInfo(memVO.getRoom()); // 방이름을 통해 챗방번호 가져오기
			List<ObjectionVO> getObjs = chatService.getObj(chatVO.getNum());
			if (getObjs.isEmpty()) {
				newobjlist.add(chatService.replaceLast(objlist[i], ":", ""));
			} else {
				boolean save = true;
				for (ObjectionVO vo : getObjs) {
					if ((vo.getId().equals(msgArr[0])) && (vo.getContent().equals(msgArr[1]))) {
						save = false;
					}
				}
				if (save) {
					newobjlist.add(chatService.replaceLast(objlist[i], ":", ""));
				}
			}

		}
		model.addAttribute("objlist", newobjlist);
		return "sendobj";
	}

	@ResponseBody
	@RequestMapping(value = "insertObj.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertObj(String objection) throws Exception {

		String[] msg = objection.split(",");
		for (String obj : msg) {
			String msgArr[] = new String[3];
			msgArr = obj.split(":");
			ChatMemberVO memVO = chatService.getRoomMember(new ChatMemberVO(0, msgArr[0], "", ""));
			ChatVO chatVO = chatService.getRoomInfo(memVO.getRoom());

			ObjectionVO objVO = new ObjectionVO(chatVO.getNum(), msgArr[0], msgArr[1]);

			chatService.insertObj(objVO);
		}
	}

	@ResponseBody
	@RequestMapping(value = "getObjList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<ObjectionVO> getObjList(@RequestBody String num) throws Exception {
		int roomnum = Integer.parseInt(num);
		List<ObjectionVO> objVO = chatService.getObjList(roomnum);

		for (ObjectionVO vo : objVO) {
			if (vo.getChatmemChatstatus().equals("NOCHAT")) {
				vo.setChatmemChatstatus("채팅금지");
			}
		}
		return objVO;
	}

	@ResponseBody
	@RequestMapping(value = "/objAccept.do", method = RequestMethod.POST)
	public void objAccept(@RequestParam(name = "objnum", required = true) int objnum) throws Exception {
		logger.info(
				"objAccept.do objAccept.do objAccept.do objAccept.do objAccept.do objAccept.do objAccept.do objAccept.do");

		System.out.println(objnum);
		chatService.objAccept(objnum);

		String id = chatService.getObjNum(objnum);
		chatService.minusWarnCnt(id);

		int warnCnt = chatService.getWarningCount(id);

		if (warnCnt < 3) {
			chatService.returnChatStatus(id);
		}
	}

	@ResponseBody
	@RequestMapping(value = "objReject.do", method = RequestMethod.POST)
	public void objReject(@RequestParam(name = "objnum", required = true) int objnum) throws Exception {
		chatService.objReject(objnum);
	}

	@RequestMapping(value = "uploadChat.do", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String encoding = "UTF-8";
		String url = "D:\\utf18_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Walalaa\\assets\\thumbnailfolder";

		ChatVO chat = new ChatVO();
		MultipartRequest multi = new MultipartRequest(request, url, 5 * 1024 * 1024, encoding,
				new DefaultFileRenamePolicy());

		chat = chatService.getRoomInfoNumber(Integer.parseInt(multi.getParameter("roomNum")));
		chat.setName(multi.getParameter("name"));
		chat.setContent(multi.getParameter("content"));
		chat.setTag(multi.getParameter("tag"));

		System.out.println(chat.toString());
		if (multi.getFilesystemName("thumbnail") != null) {
			chat.setThumbnail("/assets/thumbnailfolder/" + multi.getFilesystemName("thumbnail"));
		}
		chatService.uploadChat(chat);

		return "main";
	}

	// 사용자 지정 비속어 단어 추가
	@RequestMapping(value = "addCustomBadword.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void addCustomBadword(String email, String content) {
		email = email.replace("%40", "@");
		email = email.replace("=", "");

		System.out.println("-------컨트롤러-----addCustomBadword.do : " + email + "------------" + content);

		CustomBadwordVO vo = new CustomBadwordVO();

		vo.setEmail(email);
		vo.setContent(content);

		userService.addCustomBadword(vo);
	}

	@ResponseBody
	@RequestMapping(value = "/getCnntPPL.do", method = RequestMethod.POST)
	public List<UserVO> getCnntPPL(@RequestParam(name = "num", required = true) int num) throws Exception {
		List<UserVO> userVOs = chatService.getCnnctPPL(num);
		return userVOs;
	}

	@ResponseBody
	@RequestMapping(value = "/getUserInfo.do", method = RequestMethod.POST)
	public UserVO getUserInfo(@RequestParam(name = "id", required = true) String id) throws Exception {
		UserVO userVO = chatService.getUsersInfo(id);
		return userVO;
	}

	@ResponseBody
	@RequestMapping(value = "/delBlackList.do", method = RequestMethod.POST)
	public void delBlackList(@RequestParam(name = "email", required = true) String email,
			@RequestParam(name = "delBList", required = true) String delBList) throws Exception {
		UserVO userVO = chatService.getUsersInfo(email);
		String BList = userVO.getBlacklist();
		String afterDelstr = BList.replaceAll(delBList + "&/&", "");
		userVO.setBlacklist(afterDelstr);
		chatService.updateBlackList(userVO);
	}

	@ResponseBody
	@RequestMapping(value = "/delOperList.do", method = RequestMethod.POST)
	public void delOperList(@RequestParam(name = "email", required = true) String email,
			@RequestParam(name = "delOList", required = true) String delOList) throws Exception {
		UserVO userVO = chatService.getUsersInfo(email);
		String OList = userVO.getOperlist();
		String afterDelstr = OList.replaceAll(delOList + "&/&", "");
		userVO.setOperlist(afterDelstr);
		chatService.updateOperList(userVO);
	}

	@ResponseBody
	@RequestMapping(value = "/listupdate.do", method = RequestMethod.POST)
	public void listupdate(@RequestParam(name = "email", required = true) String email,
			@RequestParam(name = "value", required = true) String value,
			@RequestParam(name = "num", required = true) int num) throws Exception {
		String addList = email + "&/&";
		ChatVO chatVO = chatService.getRoomInfoNumber(num);
		UserVO userVO = chatService.getUsersInfo(chatVO.getOwner());

		if (value.equals("black")) {
			String BList = userVO.getBlacklist();
			String afterAddstr = BList + addList;
			userVO.setBlacklist(afterAddstr);
			chatService.updateBlackList(userVO);
		}
		if (value.equals("oper")) {
			String OList = userVO.getOperlist();
			String afterAddstr = OList + addList;
			userVO.setOperlist(afterAddstr);
			chatService.updateOperList(userVO);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getBlackListUser.do", method = RequestMethod.POST)
	public List<UserVO> getBlackListUser(@RequestParam(name = "id", required = true) String id) throws Exception {
		UserVO userVO = chatService.getUsersInfo(id);

		String bnick = "";
		bnick = userVO.getBlacklist();
		List<UserVO> nickblackList = new ArrayList<>();
		String[] blackLists = bnick.split("&/&");
		for (String str : blackLists) {
			UserVO vo = new UserVO();
			vo.setEmail(str);
			vo = userService.getUserVO(vo);

			nickblackList.add(vo);
		}
		return nickblackList;
	}

	@ResponseBody
	@RequestMapping(value = "/getOperListUser.do", method = RequestMethod.POST)
	public List<UserVO> getOperListUser(@RequestParam(name = "id", required = true) String id) throws Exception {
		UserVO userVO = chatService.getUsersInfo(id);

		String bnick = "";
		bnick = userVO.getOperlist();
		List<UserVO> nickblackList = new ArrayList<>();
		String[] blackLists = bnick.split("&/&");
		for (String str : blackLists) {
			UserVO vo = new UserVO();
			vo.setEmail(str);
			vo = userService.getUserVO(vo);

			nickblackList.add(vo);
		}
		return nickblackList;
	}

	// 검색하면 나오는 화면 - 태그만 받아오기
	@RequestMapping(value = "search_result.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getUploadList(Model model, String tag) throws Exception { // Model model, @RequestParam(name="search",
		// required=true)

		System.out.println("                                             ############### " + tag);

		model.addAttribute("tag", tag);
		return "search_result";
	}

	// 검색하면 나오는 화면 - 리스트 뽑기
	@ResponseBody
	@RequestMapping(value = "/search_result_list.do", method = RequestMethod.POST)
	public List<ChatVO> searchList(String tag) {
		System.out.println("                                    search_result_list ############### " + tag);
		return chatService.getTagList(tag);
	}

}