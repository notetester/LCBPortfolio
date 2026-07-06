package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.QNAReplyVO;
import com.lcb404.mapper.QNAReplyMapper;
import com.lcb404.utill.Criteria;

@Service("qnaReplyService")
public class QNAReplyServiceImpl implements QNAReplyService{

	@Autowired
	private QNAReplyMapper qnaReplyMapper;
	
	@Override
	public int replyRegist(QNAReplyVO vo) {

		return qnaReplyMapper.replyRegist(vo);
	}

	@Override
	public List<QNAReplyVO> getList(Criteria cri, int qno) {

		return qnaReplyMapper.getList(cri, qno);
	}

	@Override
	public int getTotal(int qno) {

		return qnaReplyMapper.getTotal(qno);
	}

	@Override
	public String getReplyPw(QNAReplyVO vo) {

		return qnaReplyMapper.getReplyPw(vo);
	}

	@Override
	public int replyUpdate(QNAReplyVO vo) {

		return qnaReplyMapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(QNAReplyVO vo) {

		return qnaReplyMapper.replyDelete(vo);
	}

}
