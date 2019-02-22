package com.utf18.site.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.utf18.site.service.ChatService;
import com.utf18.site.service.UserService;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.CustomBadwordVO;
import com.utf18.site.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private ChatService chatService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

	// 아이디 중복 확인
	@RequestMapping(value = "duplicationIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String CheckDuplication(@RequestBody String email) {

		System.out.println("-------------duplicationIdCheck UserController-------------");
		System.out.println("-------------(duplicationCheck.do)-------------");
		System.out.println(email);

		String checkRst;
		System.out.println("UserController email: " + email);

		int idCnt = userService.CheckDuplication(email.replace("%40", "@"));
		if (idCnt > 0)
			checkRst = "F";
		else
			checkRst = "S";

		return checkRst;
	}

	// 닉네임 중복 확인
	@RequestMapping(value = "duplicationNicknameCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String CheckNicknameDuplication(@RequestBody String nickname) {

		System.out.println("-------------duplicationNicknameCheck UserController-------------");
		System.out.println("-------------(duplicationNicknameCheck.do)-------------");
		System.out.println(nickname);

		String checkRst;
		System.out.println("UserController nickname: " + nickname);

		int nicknameCount = userService.CheckNicknameDuplication(nickname);
		if (nicknameCount > 0)
			checkRst = "F";
		else
			checkRst = "S";

		return checkRst;
	}

	@RequestMapping(value = "manage_user_chatting.do", method = RequestMethod.GET)
	public String manage_user_chatting() {
		return "manage_include/manage_user_chatting";
	}

	@RequestMapping(value = "manage.do", method = RequestMethod.GET)
	public String manage(Model model, int roomNum) {
		ChatVO vo = chatService.getRoomInfoNumber(roomNum);
		String roomName = vo.getName();
		model.addAttribute("roomNum", roomNum);
		model.addAttribute("roomName", roomName);
		return "manage";
	}

	@RequestMapping(value = "mychannel.do", method = RequestMethod.GET)
	public String mychannel() {
		return "mychannel";
	}

	@RequestMapping(value = "manage_user_broadcast.do", method = RequestMethod.GET)
	public String manage_user_broadcast() {
		return "manage_include/manage_user_broadcast";
	}

	@RequestMapping(value = "broadcast.do", method = RequestMethod.GET)
	public String broadcast(HttpSession session) {
		return "broadcast";
	}

	@RequestMapping(value = "broadcast_setting.do", method = RequestMethod.GET)
	public String broadcast_setting() {
		return "broadcast_setting";
	}

	@RequestMapping(value = "broadcast_finish.do", method = RequestMethod.GET)
	public String broadcast_finish(Model model, int roomNum) {
		model.addAttribute("roomNum", roomNum);
		ChatVO vo = chatService.getRoomInfoNumber(roomNum);
		model.addAttribute("chat", vo);
		return "broadcast_finish";
	}

	@RequestMapping(value = "joinform.do", method = RequestMethod.GET)
	public String loginForm() {
		return "joinform";
	}

	@RequestMapping(value = "joininsert.do", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute UserVO vo) {
		userService.insertUser(vo);
		return "loginform";
	}

	@RequestMapping(value = "loginform.do", method = RequestMethod.GET)
	public String joinForm() {
		return "loginform";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		if (userService.getUserVO(vo) != null) {
			UserVO vo2 = userService.getUserVO(vo);
			if (vo2.getPassword().equals(vo.getPassword())) {
				session.setAttribute("login", vo2);
				return "main";
			} else {
				session.setAttribute("error", "");
				return "loginform";
			}
		} else {
			session.setAttribute("error", "");
			return "loginform";
		}
	}

	@RequestMapping("findpasswordform.do")
	public String findPWform() {
		return "findpassword";
	}

	@RequestMapping("findpassword.do")
	public String findpw(UserVO vo, Model model) {
		vo = userService.getUserVO(vo);
		model.addAttribute("password", vo.getPassword());
		return "findpassword";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		UserVO vo = new UserVO();
		session.setAttribute("login", vo);
		return "main";
	}

	// 비밀번호 일치하는지 확인
	@RequestMapping(value = "checkPassword.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkPassword(@RequestBody String email) {

		System.out.println("-------------checkPassword UserController-------------");
		System.out.println("-------------(checkPassword.do)-------------");
		System.out.println(email);

		System.out.println("UserController email: " + email);

		String getPassword = userService.checkPassword(email.replace("%40", "@"));

		return getPassword;
	}

	// 사용자 '경고횟수' 설정
	@RequestMapping(value = "setWarnCount.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void setWarnCount(@RequestParam(name = "input", required = true) int manage_warncount, String email) {
		System.out.println("-------컨트롤러-----setWarnCount.do : " + manage_warncount + "------------");

		UserVO vo = new UserVO();

		vo.setManage_warncount(manage_warncount);
		vo.setEmail(email);

		userService.setWarnCount(vo);
	}

	// 적용 0 => 유저가 작성한 비속어 리스트 채팅에 적용안함
	@RequestMapping(value = "apply0.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void apply0(String email) {
		email = email.replace("%40", "@");
		email = email.replace("=", "");

		System.out.println("-------------apply0 UserController-------------");
		System.out.println("-------------(apply0.do)-------------");
		System.out.println(email);

		userService.apply0(email);
	}

	// 적용 1 => 유저가 작성한 비속어 리스트 채팅에 적용 함
	@RequestMapping(value = "apply1.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void apply1(String email) {
		email = email.replace("%40", "@");
		email = email.replace("=", "");

		System.out.println("-------------apply1 UserController-------------");
		System.out.println("-------------(apply1.do)-------------");
		System.out.println(email);

		userService.apply1(email);
	}

	// 사용자 지정 비속어 단어 삭제
	@RequestMapping(value = "deleteCustomBadword.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void deleteCustomBadword(int num) {
		System.out.println("-------컨트롤러-----deleteCustomBadword.do : " + num + "------------------");

		CustomBadwordVO vo = new CustomBadwordVO();
		vo.setNum(num);

		userService.deleteCustomBadword(vo);
	}

	// 사용자가 추가한 비속어 단어리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "getCustomBadwordList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public List<CustomBadwordVO> getWordList(@RequestParam(name = "email", required = true) String email)
			throws Exception {
		email = email.replace("%40", "@");
		email = email.replace("=", "");
		List<CustomBadwordVO> badWordList = userService.getWordList(email);
		return badWordList;
	}

	// 구독 기능
	@ResponseBody
	@RequestMapping(value = "subScribe.do", method = RequestMethod.POST )
	public void subscribe(@RequestBody String email) throws Exception {
		email = email.replace("%40", "@");
		email = email.replace("=", "");
		
		ChatMemberVO mem = new ChatMemberVO();
		mem.setId(email);
		mem = chatService.getRoomMember(mem);
		String subscribe = chatService.getRoomOwner(mem.getRoom());
		
		UserVO vo = new UserVO();
		vo.setEmail(email);
		vo = userService.getUserVO(vo);
		String addList = vo.getSubscribe() + subscribe + "&/&";;
		vo.setSubscribe(addList);
		userService.subscribe(vo);
	}

	@ResponseBody
	@RequestMapping(value = "delsubScribe.do", method = RequestMethod.POST )
	public void delsubScribe(@RequestBody String email) throws Exception {
		email = email.replace("%40", "@");
		email = email.replace("=", "");
		
		//owner 가져오기
		ChatMemberVO mem = new ChatMemberVO();
		mem.setId(email);
		mem = chatService.getRoomMember(mem);
		String owner = chatService.getRoomOwner(mem.getRoom());
		//user가져오기
		UserVO vo = new UserVO();
		vo.setEmail(email);
		vo = userService.getUserVO(vo);
		//subscribe 지우기
		String subscribe = vo.getSubscribe();
		subscribe = subscribe.replaceAll(owner+"&/&", "");
		vo.setSubscribe(subscribe);
		userService.subscribe(vo);
		
	}
	
	// 구독상태 체크
	@ResponseBody
	@RequestMapping(value = "/subScribecheck.do", method = RequestMethod.POST )
	public boolean subScribecheck(@RequestBody String email) throws Exception {
		email = email.replace("%40", "@");
		email = email.replace("=", "");
		
		//owner 가져오기
		ChatMemberVO mem = new ChatMemberVO();
		mem.setId(email);
		mem = chatService.getRoomMember(mem);
		String owner = chatService.getRoomOwner(mem.getRoom());
		//user가져오기
		UserVO vo = new UserVO();
		vo.setEmail(email);
		vo = userService.getUserVO(vo);
		
		return vo.getSubscribe().contains(owner);
	}
}
