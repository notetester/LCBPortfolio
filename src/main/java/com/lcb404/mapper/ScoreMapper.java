package com.lcb404.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.ScoreVO;

public interface ScoreMapper {

	public int registScore(@Param("mno") int mno,@Param("MEMBERS_ID") String MEMBERS_ID,@Param("score")  double score);
	public int getTotal(int mno);	
	public List<ScoreVO> getList(int mno);
}
