package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.MissReplyVO;
import com.lcb404.mapper.MissReplyMapper;
import com.lcb404.utill.Criteria;

@Service("missReplyService")
public class MissReplyServiceImpl implements MissReplyService{

	@Autowired
	private MissReplyMapper missReplyMapper;
	
	@Override
	public int replyRegist(MissReplyVO vo) {

		return missReplyMapper.replyRegist(vo);
	}

	@Override
	public List<MissReplyVO> getList(Criteria cri, int mno) {

		return missReplyMapper.getList(cri, mno);
	}

	@Override
	public int getTotal(int mno) {

		return missReplyMapper.getTotal(mno);
	}

	@Override
	public String getReplyPw(MissReplyVO vo) {

		return missReplyMapper.getReplyPw(vo);
	}

	@Override
	public int replyUpdate(MissReplyVO vo) {

		return missReplyMapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(MissReplyVO vo) {

		return missReplyMapper.replyDelete(vo);
	}

}
