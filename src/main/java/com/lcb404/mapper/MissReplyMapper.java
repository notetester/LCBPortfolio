package com.lcb404.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.MissReplyVO;
import com.lcb404.utill.Criteria;

public interface MissReplyMapper {
	public int replyRegist(MissReplyVO vo); //댓글 등록//	
	public List<MissReplyVO> getList(@Param("cri") Criteria cri,@Param("mno") int mno);
	public int getTotal(int mno);
	public String getReplyPw(MissReplyVO vo);
	public int replyUpdate(MissReplyVO vo);
	public int replyDelete(MissReplyVO vo);
}
