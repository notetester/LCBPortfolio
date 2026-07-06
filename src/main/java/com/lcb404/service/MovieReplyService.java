package com.lcb404.service;

import java.util.List;

import com.lcb404.command.MovieReplyVO;
import com.lcb404.utill.Criteria;

public interface MovieReplyService {
	public int replyRegist(MovieReplyVO vo); //댓글 등록//	
	public List<MovieReplyVO> getList(Criteria cri,int mno);
	public int getTotal(int mno);
	public String getReplyPw(MovieReplyVO vo);
	public int replyUpdate(MovieReplyVO vo);
	public int replyDelete(MovieReplyVO vo);
}

