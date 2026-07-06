package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.ScoreVO;
import com.lcb404.mapper.MovieMapper;
import com.lcb404.mapper.ScoreMapper;

@Service("scoreService")
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	private ScoreMapper scoreMapper;
	
	@Autowired
	private MovieMapper movieMapper;
	
	@Override
	public int registScore(int mno, String MEMBERS_ID, double score) {

		return scoreMapper.registScore(mno,MEMBERS_ID,score);
	}

	@Override
	public int getTotal(int mno) {

		return scoreMapper.getTotal(mno);
	}
	
	@Override
	public List<ScoreVO> getList(int mno) {

		return scoreMapper.getList(mno);
	}

	@Override
	public int updateScore(int mno, double person) {

		return movieMapper.updateScore(mno,person);
	}



}
