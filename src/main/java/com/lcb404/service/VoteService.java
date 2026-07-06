package com.lcb404.service;

import java.util.List;

import com.lcb404.command.VoteVO;

public interface VoteService {
	public List<VoteVO> getInfo();
	public int setVote(int cnt, int num);
	public int updateVote(String MEMBERS_ID);
}
