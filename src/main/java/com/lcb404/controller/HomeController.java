package com.lcb404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lcb404.service.NoticeBoardService;
import com.lcb404.utill.Criteria;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private NoticeBoardService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		Criteria cri = new Criteria(1, 3);
		
		model.addAttribute("list", noticeService.getList(cri));
		
		return "home";
	}
	
}
