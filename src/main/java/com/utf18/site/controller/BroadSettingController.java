package com.utf18.site.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.utf18.site.service.ChatMemberService;
import com.utf18.site.service.ChatService;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.UserVO;

@Controller
public class BroadSettingController {
	// 방송 셋팅 관련 컨트롤러

	@Autowired
	private ChatService chatService;

	@Autowired
	private ChatMemberService chatMemberService;

	// 방송 설정 - 방만들기
	@RequestMapping(value = "createChatRoom.do", method = { RequestMethod.POST })
	public String createChatRoom(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String encoding = "UTF-8";
		String url = "D:\\utf18_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Walalaa\\assets\\thumbnailfolder\\";

		UserVO login = (UserVO) request.getSession().getAttribute("login");

		if (login == null) {
			return "redirect:/loginform.do";
		}
		ChatVO chat = new ChatVO();
		MultipartRequest multi = new MultipartRequest(request, url, 5 * 1024 * 1024, encoding,
				new DefaultFileRenamePolicy());
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
		chatMemberService.addRoomMember(new ChatMemberVO(0, login.getEmail(), chat.getName(), ""));
		String num = String.valueOf(VO.getNum());
		// 현재 방이름 넣기
		model.addAttribute("room", chat.getName());
		model.addAttribute("roomNum", num);
		model.addAttribute("roomName", chat.getName());
		return "broadcast";
	}

	// 방송 설정 - 방송 화면 로딩
	@RequestMapping(value = "broadcast.do", method = RequestMethod.GET)
	public String broadcast(HttpSession session) {
		return "broadcast";
	}

	// 방송 설정 - 방송설정 화면 로딩
	@RequestMapping(value = "broadcast_setting.do", method = RequestMethod.GET)
	public String broadcast_setting() {
		return "broadcast_setting";
	}

	// 방송 종료 - 방송종료 페이지 로딩
	@RequestMapping(value = "broadcast_finish.do", method = RequestMethod.GET)
	public String broadcast_finish(Model model, int roomNum) {
		model.addAttribute("roomNum", roomNum);
		ChatVO vo = chatService.getRoomInfoNumber(roomNum);
		model.addAttribute("chat", vo);
		String uploadTime = vo.getUploadtime();
		
		int upload_hour = Integer.parseInt(uploadTime.substring(11, 13))*3600;
		int upload_min = Integer.parseInt(uploadTime.substring(14, 16))*60;
		int upload_sec = Integer.parseInt(uploadTime.substring(17, 19))*1;
		
		String endTime = chatService.getTime();
		int end_hour = Integer.parseInt(endTime.substring(8, 10))*3600;
		int end_min = Integer.parseInt(endTime.substring(10, 12))*60;
		int end_sec = Integer.parseInt(endTime.substring(12, 14))*1;
		
		int total_sec = (end_hour + end_min + end_sec) - (upload_hour + upload_min + upload_sec);
		int hour = 0;
		int min = 0;
		if(total_sec/3600>0) {
			hour = total_sec/3600;
			total_sec = total_sec%3600;
		}
		if(total_sec/60 >0) {
			min = total_sec/60;
			total_sec = total_sec%60;
		}
		int sec = total_sec;
		
		model.addAttribute("broadTime", hour + "시간" + min + "분" + sec +"초");
		return "broadcast_finish";
	}

	// 방송 셋팅 - 중복확인
	@ResponseBody
	@RequestMapping(value = "checkRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int checkRoom(Model model, String name) throws Exception {
		ChatVO VO = chatService.checkRoom(name);

		// 중복값이 없을경우
		if (VO == null) {
			return 1;
		} else {
			return 0;
		}
	}

	// 방송 종료 - 방송 리스트에 올리기
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

		if (multi.getFilesystemName("thumbnail") != null) {
			chat.setThumbnail("/assets/thumbnailfolder/" + multi.getFilesystemName("thumbnail"));
		}
		chatService.uploadChat(chat);

		return "main";
	}
}
