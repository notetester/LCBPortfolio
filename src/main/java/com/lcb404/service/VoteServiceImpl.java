package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.VoteVO;
import com.lcb404.mapper.VoteMapper;

@Service("voteService")
public class VoteServiceImpl implements VoteService{

	@Autowired
	private VoteMapper voteMapper;
	
	@Override
	public List<VoteVO> getInfo() {

		return voteMapper.getInfo();
	}

	@Override
	public int setVote(int cnt,int num) {

		return voteMapper.setVote(cnt, num);
	}

	@Override
	public int updateVote(String MEMBERS_ID) {

		return voteMapper.updateVote(MEMBERS_ID);
	}

}
