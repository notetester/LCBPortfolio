package com.lcb404.service;

import java.util.List;

import com.lcb404.command.QNAReplyVO;
import com.lcb404.utill.Criteria;

public interface QNAReplyService {
	public int replyRegist(QNAReplyVO vo); //댓글 등록//	
	public List<QNAReplyVO> getList(Criteria cri,int qno);
	public int getTotal(int qno);
	public String getReplyPw(QNAReplyVO vo);
	public int replyUpdate(QNAReplyVO vo);
	public int replyDelete(QNAReplyVO vo);
}
