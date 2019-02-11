package com.utf18.site.controller;

import java.text.DateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.utf18.site.service.UserService;
import com.utf18.site.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
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
	public String manage() {
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

}
