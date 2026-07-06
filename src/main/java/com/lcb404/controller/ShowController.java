package com.lcb404.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcb404.service.UserService;

@Controller
@RequestMapping("show")
public class ShowController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/trailer")
	public String trailer(HttpSession session, Model model) {
		
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
		model.addAttribute("NickName", userService.userInfo(MEMBERS_ID).getMEMBERS_NICKNAME() );
		return "show/trailer";
	}
}
