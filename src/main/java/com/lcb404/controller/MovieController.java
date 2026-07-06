package com.lcb404.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcb404.command.MovieVO;
import com.lcb404.service.MovieService;
import com.lcb404.service.ScoreService;
import com.lcb404.service.UserService;
import com.lcb404.service.VoteService;

@Controller
@RequestMapping("movie")
public class MovieController {
	
	@Autowired
	private VoteService voteService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MovieService movieService;
	
	

	@RequestMapping("/movieChart")
	public String movieChart() {
		return "movie/movieChart";
	}
	
	@ResponseBody
	@GetMapping("/getList/{MOVIE_CODE}")
	public MovieVO getList(@PathVariable("MOVIE_CODE") int MOVIE_CODE){

		System.out.println(MOVIE_CODE);
		
		return movieService.getList(MOVIE_CODE);
	}
	
	
	@RequestMapping("/movieDetail")
	public String movieDetail(@RequestParam("mno") int mno,Model model) {
		
		
		
		
		model.addAttribute("mno", mno);
		
		
		
		return "movie/movieDetail";
	}
	
	@ResponseBody
	@PostMapping("/movieLike")
	public int movieLike(@RequestBody MovieVO vo,HttpSession session ){
		String MEMBERS_ID=(String)session.getAttribute("MEMBERS_ID");
		
		
		int result = movieService.movieLike(vo,MEMBERS_ID);
		
		if(result ==1 ) { // 좋아요를 안누른 회원
			
			return movieService.updateLike(vo);
		}else { // 좋아요를 눌렀던 회원			
			return 	2;
		}
	}
	
	

	@RequestMapping("/vote")
	public String vote(Model model,HttpSession session) {
				
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
		
		model.addAttribute("voter", userService.userInfo(MEMBERS_ID).getVOTER());
		
		model.addAttribute("list", voteService.getInfo());
		
		return "movie/vote";
	}
}
