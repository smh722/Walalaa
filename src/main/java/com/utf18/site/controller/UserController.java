package com.utf18.site.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.utf18.site.service.UserService;
import com.utf18.site.vo.UserVO;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value ="joinform.do", method = RequestMethod.GET)
	public String loginForm() {
		return "joinform";
	}
	@RequestMapping(value ="main.do", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value ="manage.do", method = RequestMethod.GET)
	public String manage() {
		return "manage";
	}

	@RequestMapping(value ="joininsert.do", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute UserVO vo) {
		userService.insertUser(vo);
		return "loginpage";
	}
	
	@RequestMapping(value ="loginform.do" , method = RequestMethod.GET)
	public String joinForm() {
		return "loginform";
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		if (userService.getUserVO(vo) != null) {
			UserVO vo2 = userService.getUserVO(vo);
			if (vo2.getPassword().equals(vo.getPassword())) {
				session.setAttribute("email", vo2.getEmail());
				session.setAttribute("password", vo2.getPassword());
				session.setAttribute("nickname", vo2.getNickname());
				return "list.do";
			} else {
				session.setAttribute("error", "鍮꾨�踰덊샇媛� 留욎��븡�뒿�땲�떎");
				return "loginform";
			}
		} else {
			session.setAttribute("error", "�븘�씠�뵒媛� 留욎��븡�뒿�땲�떎");
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
	

}
