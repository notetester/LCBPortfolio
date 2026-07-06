package com.lcb404.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcb.email.EmailDTO;
import com.lcb.email.EmailService;
import com.lcb404.command.KakaoVO;
import com.lcb404.command.MissingBoardVO;
import com.lcb404.command.MovieVO;
import com.lcb404.command.QNABoardVO;
import com.lcb404.command.ReserveVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.command.UserVO;
import com.lcb404.service.MissingBoardService;
import com.lcb404.service.QNABoardService;
import com.lcb404.service.UserService;
import com.lcb404.utill.Criteria;
import com.lcb404.utill.PageVO;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	private MissingBoardService missingBoardService;
	
	@Autowired
	private QNABoardService qnaBoardService;
	
	
	@Autowired
	@Qualifier("emailService")
	EmailService emailService; // 서비스를 호출하기위한 의존성 주입
	

    @Autowired
    JavaMailSender mailSender; 
	
	@RequestMapping("/searchpw")
	public String searchpw() {
		
		return "user/searchpw";
	}
	
	@RequestMapping("/searchid")
	public String searchid() {
		
		return "user/searchid";
	}
	
		
	
	   
    @RequestMapping("/sendpw.do")
    public String sendpw(@ModelAttribute EmailDTO dto,UserVO vo, Model model) {
    	
    	if(!StringUtils.isBlank(vo.getMEMBERS_EMAIL())) {
    	
	    	dto.setSenderName("관리자");
	    	dto.setSenderMail("noreply@lcb.local");
	    	dto.setReceiveMail(vo.getMEMBERS_EMAIL());
	    	dto.setMessage("비밀번호는"+userService.getPw(vo)+"입니다.");
	    	
	        try {
	 
	            emailService.sendMail(dto); // dto (메일관련 정보)를 sendMail에 저장함
	            model.addAttribute("msg", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("msg", "이메일 발송 오류..."); // 이메일 발송이 실패되었다는 메시지를 출력
	        }
    	} else {
    		 model.addAttribute("msg", "이메일 발송 실패..."); 
    	}
        return "redirect:/"; // 실패했으므로 다시 write jsp 페이지로 이동함
    }


    @RequestMapping("/sendid.do")
    public String sendid(@ModelAttribute EmailDTO dto,UserVO vo, Model model) {
    	
    	if(!StringUtils.isBlank(vo.getMEMBERS_EMAIL())) {
    	
	    	dto.setSenderName("관리자");
	    	dto.setSenderMail("noreply@lcb.local");
	    	dto.setReceiveMail(vo.getMEMBERS_EMAIL());
	    	dto.setMessage("아이디는"+userService.getId(vo)+"입니다.");
	    	
	        try {
	 
	            emailService.sendMail(dto); // dto (메일관련 정보)를 sendMail에 저장함
	            model.addAttribute("msg", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("msg", "이메일 발송 오류..."); // 이메일 발송이 실패되었다는 메시지를 출력
	        }
    	} else {
    		 model.addAttribute("msg", "이메일 발송 실패..."); 
    	}
        return "redirect:/"; // 실패했으므로 다시 write jsp 페이지로 이동함
    }
    
	
	@RequestMapping("/user_join")
	public String user_join() {
		return "user/user_join";
	}

	@RequestMapping("/user_login")
	public String user_login() {
		return "user/user_login";
	}

	@RequestMapping("/user_update")
	public String user_update(UserVO vo, Model model, HttpSession session) {
		vo = userService.userInfo((String) session.getAttribute("MEMBERS_ID"));
		model.addAttribute("UserVO", vo);
		return "user/user_update";
	}
	
	@RequestMapping("/user_delete")
	public String user_delete() {
		
		return "user/user_delete";
	}

	@RequestMapping("/user_mypage")
	public String user_mypage(HttpSession session, Model model) {
		String MEMBERS_ID = (String) session.getAttribute("MEMBERS_ID");
		
		Criteria cri = new Criteria(1, 5);
		
		int ticket = userService.getTicket(MEMBERS_ID);		
		model.addAttribute("ticket", ticket);
		
		List<ReserveVO> HistoryList = userService.getHistory(MEMBERS_ID,cri);
		
		for(int i=0; i<HistoryList.size(); i++) {
			
			TimeTableVO timeTableVO = userService.getDay(HistoryList.get(i).getTimetable_number());
			
			HistoryList.get(i).setStart_time(timeTableVO.getTimetable_start());
			HistoryList.get(i).setEnd_time(timeTableVO.getTimetable_end());
						
			MovieVO movieVO = userService.getMovie(timeTableVO.getMovie_code());
			HistoryList.get(i).setMovie_name(movieVO.getMOVIE_TITLE());
			
		}
		
		int total = userService.getTotal(MEMBERS_ID);
		
		PageVO pageVO = new PageVO(cri, total);
		model.addAttribute("pageVO",pageVO);
		
		
		int total1 = qnaBoardService.getMyTotal(MEMBERS_ID);		
		
		PageVO pageVO1 = new PageVO(cri,total1);
		model.addAttribute("pageVO1", pageVO1);		
		
		
		
		int total2 = missingBoardService.getMyTotal(MEMBERS_ID);		
		
		PageVO pageVO2 = new PageVO(cri,total2);
		model.addAttribute("pageVO2", pageVO2);		
		
		
		model.addAttribute("QNAList", qnaBoardService.QNAMyList(cri,MEMBERS_ID));		
		model.addAttribute("MissingList", missingBoardService.MissingMyList(cri,MEMBERS_ID));
		model.addAttribute("HistoryList", HistoryList);		
		model.addAttribute("UserVO", userService.userInfo(MEMBERS_ID));
		
		return "user/user_mypage";
	}

	@RequestMapping("/KakaoLogin")
	public String KakaoLogin() {
		return "user/KakaoLogin";
	}
	
	@RequestMapping("/KakaoJoin")
	public String KakaoJoin(KakaoVO vo,Model model,HttpSession session) {
		
		String MEMBERS_ID = vo.getKakao_ID();
		String MEMBERS_PW = "DEFAULT_MEMBERS_PW";
		
		UserVO uservo = new UserVO();
		uservo.setMEMBERS_ID(MEMBERS_ID);
		uservo.setMEMBERS_PW(MEMBERS_PW);
		
		int result = userService.login(uservo);
		if(result == 1) {
			session.setAttribute("MEMBERS_ID", MEMBERS_ID);
			return "redirect:/";
		}else{
			
			model.addAttribute("Kakao_ID", vo.getKakao_ID());
			model.addAttribute("Kakao_Email", vo.getKakao_Email());
			model.addAttribute("Kakao_NickName", vo.getKakao_NickName());
			return "user/KakaoJoin";
			
		}
			
		
		
		
		
	}

	// 로그인 필요
		@RequestMapping("/user_needLogin")
		public String user_needLogin(RedirectAttributes RA) {

		
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스 입니다.");
			
			return "redirect:/user/user_login";
		}
	
	
	// 회원가입
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String joinForm(UserVO vo, RedirectAttributes RA) {

		int result = userService.join(vo);
		if (result == 1) { // 가입성공
			RA.addFlashAttribute("msg", "회원가입을 축하합니다");
		} else {
			RA.addFlashAttribute("msg", "회원가입에 실패했습니다");
		}
		return "redirect:/user/user_login";
	}

	
	  // 카카오 회원가입
	  
	  @RequestMapping(value = "/KakaoJoinForm", method = RequestMethod.POST) 
	  public String KakaoJoinForm(UserVO vo, RedirectAttributes RA) {
	  
		  int result = userService.Kakaojoin(vo); 
		  if (result == 1) { // 가입성공
		  RA.addFlashAttribute("msg", "회원가입을 축하합니다"); 
		  return "redirect:/user/user_login";
		  } else {
		  RA.addFlashAttribute("msg", "이미 등록된 회원 입니다"); 
		   
		  return "redirect:/user/user_login";
		  }
	  }
	 
	@ResponseBody
	@RequestMapping(value = "/IdCheck", method = RequestMethod.POST)
	public int IdCheck(@RequestBody String MEMBERS_ID) {
		return userService.IdCheck(MEMBERS_ID);

	}

	// 로그인
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST)
	public String loginForm(UserVO vo, HttpSession session, RedirectAttributes RA,HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int result3 = userService.getGrade(vo.getMEMBERS_ID());
		if(result3 == 1){
			RA.addFlashAttribute("msg","관리자입니다.");
		}
		
		
		int result2 = userService.statusCheck(vo.getMEMBERS_ID());
		if(result2 == 1) {
		RA.addFlashAttribute("msg", "카카오 아이디는 카카오로 로그인을 해주세요");
			
			return "redirect:/user/user_login";
		}else {
		
		System.out.println(vo.getMEMBERS_ID());
		System.out.println(vo.getMEMBERS_PW());
		int result = userService.login(vo); // 1이면 로그인, 0이면 실패

		if (result == 1) {

			session.setAttribute("MEMBERS_ID", vo.getMEMBERS_ID()); // 세션에 저장
			return "redirect:/"; // 홈

		} else {
			RA.addFlashAttribute("msg", "아이디 비밀번호를 확인하세요");
			return "redirect:/user/user_login";
		}
		}

	}

	@RequestMapping("/user_logout")
	public String userLogout(HttpSession session) {
		session.invalidate(); // 세션정보 삭제

		return "redirect:/";
	}

	
	 @RequestMapping("/updateForm") 
	 public String ModifyForm(UserVO vo,RedirectAttributes RA) {
	 
		 System.out.println(vo.getMEMBERS_ID());
		 int result = userService.Update(vo);
	 if(result == 0) { RA.addFlashAttribute("msg", "정보 수정이 실패했습니다");
	  
	 }else { RA.addFlashAttribute("msg", "정보 수정이 정상 처리되었습니다");
	  
	 } 
	 return "redirect:/user/user_mypage"; 
	 
	 }
	 

	@RequestMapping("/DeleteForm")
	public String UserDelete(UserVO vo, RedirectAttributes RA,HttpSession session) {
		
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");		
		
		int result = userService.delete(MEMBERS_ID,vo.getMEMBERS_PW());
		if (result == 0) {
			RA.addFlashAttribute("msg", "탈퇴에 실패했습니다");
			
		} else {
			RA.addFlashAttribute("msg", "탈퇴에 성공했습니다");
			session.invalidate(); // 세션정보 삭제
		}

		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping("/getList/{pageNum}")
	public  Map<String,Object> getList(@PathVariable("pageNum") int pageNum, HttpSession session){
		
		String MEMBERS_ID = (String) session.getAttribute("MEMBERS_ID");
		
		Criteria cri = new Criteria(pageNum, 5);
		
		List<ReserveVO> HistoryList = userService.getHistory(MEMBERS_ID,cri);
		
		for(int i=0; i<HistoryList.size(); i++) {
			
			TimeTableVO timeTableVO = userService.getDay(HistoryList.get(i).getTimetable_number());
			
			HistoryList.get(i).setStart_time(timeTableVO.getTimetable_start());
			HistoryList.get(i).setEnd_time(timeTableVO.getTimetable_end());
						
			MovieVO movieVO = userService.getMovie(timeTableVO.getMovie_code());
			HistoryList.get(i).setMovie_name(movieVO.getMOVIE_TITLE());
			
		}
		
		int total = userService.getTotal(MEMBERS_ID);
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("total", total);
		map.put("list", HistoryList);

		return map;
	}
	
	@ResponseBody
	@GetMapping("/getQnaList/{pageNum}")
	public  Map<String,Object> getQnaList(@PathVariable("pageNum") int pageNum, HttpSession session){
		
		String MEMBERS_ID = (String) session.getAttribute("MEMBERS_ID");
		
		Criteria cri = new Criteria(pageNum, 5);
		
		List<QNABoardVO> QNAList = qnaBoardService.QNAMyList(cri,MEMBERS_ID);		
		int total = qnaBoardService.getMyTotal(MEMBERS_ID);
		
		PageVO pageVO = new PageVO(cri,total);
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("total", total);
		map.put("list", QNAList);
		map.put("pageVO", pageVO);	

		return map;
	}
	
	@ResponseBody
	@GetMapping("/getMissList/{pageNum}")
	public  Map<String,Object> getMissList(@PathVariable("pageNum") int pageNum, HttpSession session){
		
		String MEMBERS_ID = (String) session.getAttribute("MEMBERS_ID");
		
		Criteria cri = new Criteria(pageNum, 5);
		
		List<MissingBoardVO> MissingList = missingBoardService.MissingMyList(cri,MEMBERS_ID);		
		int total = missingBoardService.getMyTotal(MEMBERS_ID);
		
		PageVO pageVO = new PageVO(cri,total);
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("total", total);
		map.put("list", MissingList);
		map.put("pageVO", pageVO);	

		return map;
	}
	
}
