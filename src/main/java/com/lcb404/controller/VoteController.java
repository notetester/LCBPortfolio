package com.lcb404.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lcb404.service.VoteService;

@RestController
@RequestMapping("/vote")
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	@GetMapping("/getList/{cnt}/{num}")
	public int setVote(@PathVariable("cnt") int cnt,@PathVariable("num") int num,HttpSession session ) {
		
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
		if(MEMBERS_ID.equals("kkk123")) {
			System.out.println(2);
			return voteService.setVote(cnt,num)+1;
		}else {
			System.out.println(1);
			voteService.updateVote(MEMBERS_ID);
			return voteService.setVote(cnt,num);
		}
		
	}
}
