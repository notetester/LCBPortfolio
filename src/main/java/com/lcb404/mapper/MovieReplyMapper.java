package com.lcb404.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.MovieReplyVO;
import com.lcb404.utill.Criteria;

public interface MovieReplyMapper {
	public int replyRegist(MovieReplyVO vo); //댓글 등록//	
	public List<MovieReplyVO> getList(@Param("cri") Criteria cri,@Param("mno") int mno);
	public int getTotal(int mno);
	public String getReplyPw(MovieReplyVO vo);
	public int replyUpdate(MovieReplyVO vo);
	public int replyDelete(MovieReplyVO vo);
}
