package com.lcb404.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcb404.command.HrVO;

import com.lcb404.service.HrService;
import com.lcb404.utill.Criteria;
import com.lcb404.utill.PageVO;

@Controller		// controller 지정
@RequestMapping("hr")   // 폴더명
public class HrController {
	
	@Autowired
   private HrService hrService;
	
	@RequestMapping("/hrNotice")
	public String hrNotice() {
		
		return "hr/hrNotice";
	}

	
	@RequestMapping("/hrList") // 채용리스트로 가기
	public String hrinfo(Criteria cri,Model model) {
		
		List<HrVO> list= hrService.getList(cri);
		model.addAttribute("hrVO",list);
		
		int total = hrService.getTotal(cri);
		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("pageVO", pageVO);		
		model.addAttribute("cri", cri);
		
		return "hr/hrList";
	}
	
	@RequestMapping("/hrRegist")  // 채용등록하기
	public String regist() {
		return"hr/hrRegist";
	}
	
	@RequestMapping("/RegistForm")
	public String RegistForm(HrVO hrVO) {
		
		hrService.regist(hrVO);
		
		return"redirect:/hr/hrList";
	}
	@RequestMapping("/hrDetail")
	public String getDetail(@RequestParam("hrtno") int hrtno, Model model) {
		
		
		model.addAttribute("hrVO", hrService.getContent(hrtno));
		
		return "hr/hrDetail";
	}
	@RequestMapping("/hrModify")
	public String getModify(HrVO vo, Model model) {
		
		
		model.addAttribute("hrVO", vo);
		
		return "hr/hrModify";
	}
	@RequestMapping("/hrUpdate")
	public String getUpdate(HrVO vo, RedirectAttributes RA) {
					
		
		int result = hrService.getUpdate(vo);
		
		if(result == 0) {
			RA.addFlashAttribute("msg", "채용게시글 수정이 실패했습니다, 채용담당자에게 문의하시기 바랍니다.");
		}else {
			RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");
		}		
		return "redirect:/hr/hrList";
	}
	@RequestMapping("/hrDelete")
	public String getDelete(@RequestParam("hrtno") int hrtno, RedirectAttributes RA) {
		System.out.println(hrtno);
		int result =hrService.getDelete(hrtno);
		
		if(result ==0) {
			RA.addFlashAttribute("msg", "채용게시글 수정이 실패했습니다, 채용담당자에게 문의하시기 바랍니다.");
		}else {
			RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");
		}		
		return "redirect:/hr/hrList";
	}
	


}
