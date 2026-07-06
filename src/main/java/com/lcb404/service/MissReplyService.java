package com.lcb404.service;

import java.util.List;

import com.lcb404.command.MissReplyVO;
import com.lcb404.utill.Criteria;

public interface MissReplyService {
	public int replyRegist(MissReplyVO vo); //댓글 등록//	
	public List<MissReplyVO> getList(Criteria cri,int mno);
	public int getTotal(int mno);
	public String getReplyPw(MissReplyVO vo);
	public int replyUpdate(MissReplyVO vo);
	public int replyDelete(MissReplyVO vo);
}
