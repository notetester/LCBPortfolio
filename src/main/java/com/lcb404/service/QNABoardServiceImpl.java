package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.QNABoardVO;
import com.lcb404.mapper.QNABoardMapper;
import com.lcb404.utill.Criteria;


@Service("qnaBoardService")
public class QNABoardServiceImpl implements QNABoardService{

	@Autowired
	private QNABoardMapper qnaBoardMapper;
	
	@Override
	public int QNAregist(QNABoardVO vo) {
		
		return qnaBoardMapper.QNAregist(vo);
		
	}

	@Override
	public List<QNABoardVO> QNAgetList(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.QNAgetList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.getTotal(cri);
	}

	@Override
	public QNABoardVO getContent(int bno) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.getContent(bno);
	}

	@Override
	public int Update(QNABoardVO vo) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.Update(vo);
	}

	@Override
	public int delete(int qna_number) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.delete(qna_number);
	}

	@Override
	public List<QNABoardVO> QNAMyList(Criteria cri, String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.QNAMyList(cri, MEMBERS_ID);
	}

	@Override
	public int getMyTotal(String MEMBERS_ID) {
		// TODO Auto-generated method stub
		return qnaBoardMapper.getMyTotal(MEMBERS_ID);
	}

	
	
}
