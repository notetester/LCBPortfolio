package com.lcb404.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.QNAReplyVO;
import com.lcb404.utill.Criteria;

public interface QNAReplyMapper {
	public int replyRegist(QNAReplyVO vo); //댓글 등록//	
	public List<QNAReplyVO> getList(@Param("cri") Criteria cri,@Param("qno") int qno);
	public int getTotal(int qno);
	public String getReplyPw(QNAReplyVO vo);
	public int replyUpdate(QNAReplyVO vo);
	public int replyDelete(QNAReplyVO vo);
}
