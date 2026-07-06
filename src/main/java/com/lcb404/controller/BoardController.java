package com.lcb404.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcb404.command.NoticeBoardVO;
import com.lcb404.command.QNABoardVO;
import com.lcb404.service.NoticeBoardService;
import com.lcb404.service.QNABoardService;
import com.lcb404.utill.Criteria;
import com.lcb404.utill.PageVO;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired	
	private NoticeBoardService noticeBoardService;

	@Autowired
	private QNABoardService qnaBoardService;
	
		@RequestMapping("/notice")
		public String notice(Criteria cri,Model model) {
			
			List<NoticeBoardVO> list = noticeBoardService.getList(cri);
			model.addAttribute("noticeBoardList", list);
			
			int total = noticeBoardService.getTotal(cri);
			
			
			PageVO pageVO = new PageVO(cri,total);
			model.addAttribute("pageVO", pageVO);		
			model.addAttribute("cri", cri);
			
			return "board/notice";
		}
		
		@RequestMapping("/noticeRegist")
		public String noticeRegist() {			
			return "board/noticeRegist";
		}
		
		@RequestMapping("/noticeRegistForm")
		public String noticeRegistForm(NoticeBoardVO noticeBoardVO) {
			
			noticeBoardService.regist(noticeBoardVO);
			return "redirect:/board/notice";
		}		
		
		
		@RequestMapping("/noticeDetail")
		public String noticeDetail(@RequestParam("tno") int tno, Model model) {
			
			
			model.addAttribute("noticeBoardVO", noticeBoardService.getContent(tno));
			
			return "board/noticeDetail";
		}
		
		@RequestMapping("/noticeModify")
		public String noticeModify(NoticeBoardVO vo, Model model) {
			
			
			model.addAttribute("noticeBoardVO", vo);
			
			return "board/noticeModify";
		}
		
		@RequestMapping("/noticeUpdate")
		public String noticeUpdate(NoticeBoardVO vo, RedirectAttributes RA) {
						
			
			int result = noticeBoardService.getUpdate(vo);
			
			if(result == 0) {
				RA.addFlashAttribute("msg", "게시글 수정이 실패했습니다");
			}else {
				RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");
			}		
			return "redirect:/board/notice";
		}
		
		@RequestMapping("/noticeDelete")
		public String noticeDelete(@RequestParam("tno") int tno, RedirectAttributes RA) {
						
			System.out.println(tno);
			int result = noticeBoardService.getDelete(tno);
			
			if(result == 0) {
				RA.addFlashAttribute("msg", "게시글 수정이 실패했습니다");
			}else {
				RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");
			}		
			return "redirect:/board/notice";
		
		
		}
		
		
		
		@RequestMapping("/FAQ")
		public String FAQ() {
			return "board/FAQ";
		}
		
		
		@RequestMapping("/QNA")
		public String QNA() {
			return "board/QNA";
		}
		@RequestMapping(value="/QNARegist",method=RequestMethod.POST)
		public String QNARegist(QNABoardVO vo,RedirectAttributes RA) {
			
			
			int result = qnaBoardService.QNAregist(vo);
			
			if(result == 0) {
				RA.addFlashAttribute("msg", "게시글 등록에 실패했습니다");
				
				}else {
				RA.addFlashAttribute("msg", "게시글 등록이 정상 처리되었습니다");						
				}
			
			
			return "redirect:/board/QNAList";
		}
				
		@RequestMapping("/QNAList")
		public String QNAList(Criteria cri,Model model) {
			model.addAttribute("QNABoardList",qnaBoardService.QNAgetList(cri) );
			int total = qnaBoardService.getTotal(cri);		
			PageVO pageVO = new PageVO(cri,total);
			model.addAttribute("pageVO", pageVO);		
			model.addAttribute("cri", cri);
			
			return "board/QNAList";
		}
		
		
		
	
		@RequestMapping("/QNADetail")
		public String QNADetail(@RequestParam("bno")int bno, Model model) {
			QNABoardVO vo = qnaBoardService.getContent(bno);
			model.addAttribute("QNABoardVO", vo);
			
			return "board/QNADetail";
		}
		
		
		
		@RequestMapping("/QNAModify")
		public String QNAModify(QNABoardVO vo, Model model) {
			
			model.addAttribute("QNABoardVO", vo);
			
			return "board/QNAModify";
			
			}
		
		@RequestMapping("/ModifyForm")
		public String ModifyForm(QNABoardVO vo,RedirectAttributes RA) {
			System.out.println("폼컨");
			int result = qnaBoardService.Update(vo);
			if(result == 0) {
			RA.addFlashAttribute("msg", "게시글 수정이 실패했습니다");
			
			}else {
			RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");						
			}
			return "redirect:/board/QNAList";
		}
		
		@RequestMapping("/QNADelete")
		public String QNADelete(QNABoardVO vo,RedirectAttributes RA) {
			
			int result = qnaBoardService.delete(vo.getQna_number());
			
			if(result==0) {
				RA.addFlashAttribute("msg", "게시글 삭제가 실패했습니다");			
			}else {
				RA.addFlashAttribute("msg", "게시글 삭제가 성공했습니다");
			}
			return "redirect:/board/QNAList";
		}	
		
		
		
}
