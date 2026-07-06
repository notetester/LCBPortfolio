package com.lcb404.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lcb404.command.EventVO;
import com.lcb404.service.EventService;
import com.lcb404.service.UserService;

@Controller
@RequestMapping("menuevent")
public class EventController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("/events")
	public String events() {
		return "/menuevent/events";
		
	}
	
	@RequestMapping("/memberShip")
	public String memberShip(HttpSession session,Model model) {
		
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
		
		model.addAttribute("MEMBERS_POINT", userService.userInfo(MEMBERS_ID).getMEMBERS_POINT());
		
		return "/menuevent/memberShip";
		
	}
	
	@RequestMapping("/eventDetail")
	public String eventDetail(@RequestParam("eno") int eno,Model model) {
		
		EventVO vo = eventService.getEvent(eno);
		
		model.addAttribute("Event_Title", vo.getEVENT_TITLE());
		model.addAttribute("Event_StartDate", vo.getEVENT_STARTDATE());
		model.addAttribute("Event_EndDate", vo.getEVENT_ENDDATE());
		model.addAttribute("Event_URL", vo.getEVENT_URL());
		
		return "/menuevent/eventDetail";
		
	}
	
}

