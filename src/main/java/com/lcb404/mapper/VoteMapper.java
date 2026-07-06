package com.lcb404.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.VoteVO;

public interface VoteMapper {
	public List<VoteVO> getInfo();
	public int setVote(@Param("cnt") int cnt,@Param("num") int num);
	public int updateVote(String MEMBERS_ID);
}
