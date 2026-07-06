package com.lcb404.service;

import java.util.List;

import com.lcb404.command.ScoreVO;

public interface ScoreService {
	public int registScore(int mno,String MEMBERS_ID, double score);
	public int getTotal(int mno);
	public int updateScore(int mno, double person);
	public List<ScoreVO> getList(int mno);
}
