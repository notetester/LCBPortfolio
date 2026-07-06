package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.MovieReplyVO;
import com.lcb404.mapper.MovieReplyMapper;
import com.lcb404.utill.Criteria;


@Service("movieReplyService")
public class MovieReplyServiceImpl implements MovieReplyService{

	@Autowired
	private MovieReplyMapper movieReplyMapper;
	
	@Override
	public int replyRegist(MovieReplyVO vo) {

		return movieReplyMapper.replyRegist(vo);
	}

	@Override
	public List<MovieReplyVO> getList(Criteria cri, int mno) {

		return movieReplyMapper.getList(cri, mno);
	}

	@Override
	public int getTotal(int mno) {

		return movieReplyMapper.getTotal(mno);
	}

	@Override
	public String getReplyPw(MovieReplyVO vo) {
		
		return movieReplyMapper.getReplyPw(vo);
	}

	@Override
	public int replyUpdate(MovieReplyVO vo) {

		return movieReplyMapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(MovieReplyVO vo) {

		return movieReplyMapper.replyDelete(vo);
	}

}
