package com.lcb404.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lcb404.command.MovieReplyVO;
import com.lcb404.command.QNAReplyVO;
import com.lcb404.service.MovieReplyService;
import com.lcb404.service.QNAReplyService;
import com.lcb404.utill.Criteria;

@RestController //비동기 전용 댓글 컨트롤러
@RequestMapping("/qreply")
public class QNAReplyController {
	
	@Autowired
	private QNAReplyService qnaReplyService;
	
	@PostMapping("/QNAReply")
	public int replyRegist(@RequestBody QNAReplyVO vo) { //json형식으로 받을때 @RequestBody를 붙인다.
		
		
		
		return qnaReplyService.replyRegist(vo); //성공 실패여부 반환
	}	
	
	
	@GetMapping("/getList/{qno}/{pageNum}") // /값/값/값
	public Map<String,Object> getList(@PathVariable("qno") int qno,@PathVariable("pageNum") int pageNum){
			
		//1. 화면에 더보기 버튼 활성화 더보기 버튼 이벤트
		//2. getList(글번호, 페이지 번호)
		//3. @Param을 메퍼의 인터페이스에 사용
		//4. 쿼리문을 페이징 쿼리로 변경
		//5. 레스트 방식은 화면에 필요한 값을 여러개 보낼때 화면에 map이나 vo방식으로 필요한 데이터를 한번에 처리
		
		Criteria cri = new Criteria( pageNum,20); //화면에서 전달되는 페이지 번호, 데이터수
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("total", qnaReplyService.getTotal(qno));
		map.put("list", qnaReplyService.getList(cri,qno));		
		
		
		return map;
	}
	
	@PostMapping("/replyUpdate")
	public int replyUpdate(@RequestBody QNAReplyVO vo) { //json형식으로 받을때 @RequestBody를 붙인다.
		System.out.println(vo.getQrno());
		if(vo.getReplyPw().equals(qnaReplyService.getReplyPw(vo)))
			return qnaReplyService.replyUpdate(vo); //성공 실패여부 반환
		else
			return 0;
	}
	
	@PostMapping("/replyDelete")
	public int replyDelete(@RequestBody QNAReplyVO vo) { //json형식으로 받을때 @RequestBody를 붙인다.
		System.out.println(vo.getQrno());
		if(vo.getReplyPw().equals(qnaReplyService.getReplyPw(vo)))
			return qnaReplyService.replyDelete(vo); //성공 실패여부 반환
		else
			return 0;
	}
}
