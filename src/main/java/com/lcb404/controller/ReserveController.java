package com.lcb404.controller;



import java.util.List;

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

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.command.UserVO;
import com.lcb404.service.MovieService;
import com.lcb404.service.ReserveService;
import com.lcb404.service.UserService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/seatReserve")
	public String seatReserve(@RequestParam("timetable_number") int timetable_number,
							  @RequestParam("movie_code") int movie_code,
							  Model model, HttpSession session) {
		
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
	
		model.addAttribute("list", reserveService.getList(timetable_number));
		model.addAttribute("timetable_number", timetable_number);
		model.addAttribute("movie_code", movie_code);
		model.addAttribute("point", userService.userInfo(MEMBERS_ID).getMEMBERS_POINT());
		
		return "reserve/seatReserve";
	}
	
	@RequestMapping("/theater")
	public String theater() {
		return "reserve/theater";
	}
	
	@RequestMapping("/ticketSchedule")
	public String ticketSchedule(@RequestParam("num") int num, Model model) {
		
		model.addAttribute("num", num);
		return "reserve/ticketSchedule";
	}	
	
	@ResponseBody
	@PostMapping("/reserveSeat")
	public String reserveSeat(SeatNumVO seatNum,HttpSession session ) {
		
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
		
		
		
		
		int result = reserveService.setSeat(seatNum,MEMBERS_ID);
		
		
		
		if(result==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@PostMapping("/total")
	public int total(@RequestBody SeatNumVO seatNum) {
		
		int mno = reserveService.getMovieCode(seatNum.getTimetable_number());
		System.out.println(mno);
		List<TimeTableVO> list = reserveService.getTimeTable(mno);
		
		double sum=0;
		for(int i=0; i<list.size(); i++) {
			
			
			sum+=reserveService.getMovieReserve(list.get(i).getTimetable_number());
		}
		System.out.println(sum);
		
		int total = reserveService.getTotal();
		System.out.println(total);
		
		double result = Math.round((sum/total)*1000)/10.0;
		System.out.println(result);
		
		movieService.updateRate(result,mno);
		
		
		return reserveService.total(seatNum);
		
	}
	
	@ResponseBody
	@PostMapping("/point")
	public int point(@RequestBody UserVO vo,HttpSession session) {
		System.out.println(vo.getMEMBERS_POINT());
		String MEMBERS_ID=(String)session.getAttribute("MEMBERS_ID");
		
		vo.setMEMBERS_ID(MEMBERS_ID);
		
		return userService.updatePoint(vo);
		
	}
	
	
	@ResponseBody
	@GetMapping("/getTime/{day}")
	public List<TimeTableVO> getTime(@PathVariable("day") String day) {
		
		System.out.println(day);
		
		return reserveService.getTime(day);
	}
	
	@ResponseBody
	@GetMapping("/getSeat/{bno}")
	public List<ReserveVO> getSeat(@PathVariable("bno") int bno) {
		
		return reserveService.getList(bno);
	}
	
	@ResponseBody
	@GetMapping("/getPost/{bno}")
	public TimeTableVO getPost(@PathVariable("bno") int bno) {
		
		return reserveService.getPoster(bno);
	}
	
}
