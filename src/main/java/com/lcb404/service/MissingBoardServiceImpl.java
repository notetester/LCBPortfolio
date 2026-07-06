package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.MissingBoardVO;
import com.lcb404.command.QNABoardVO;
import com.lcb404.mapper.MissingBoardMapper;
import com.lcb404.utill.Criteria;


@Service("missingBoardService")
public class MissingBoardServiceImpl implements MissingBoardService{

	
	@Autowired
	private MissingBoardMapper missingBoardMapper;
	
	@Override
	public int Missingregist(MissingBoardVO vo) {
		
		return missingBoardMapper.Missingregist(vo);
	}

	@Override
	public List<MissingBoardVO> MissinggetList(Criteria cri) {
		// TODO Auto-generated method stub
		return missingBoardMapper.MissinggetList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return missingBoardMapper.getTotal(cri);
	}

	@Override
	public MissingBoardVO getContent(int found_number) {
		// TODO Auto-generated method stub
		return missingBoardMapper.getContent(found_number);
	}

	@Override
	public int Update(MissingBoardVO vo) {
		// TODO Auto-generated method stub
		return missingBoardMapper.Update(vo);
	}

	@Override
	public int delete(int qna_number) {
		// TODO Auto-generated method stub
		return missingBoardMapper.delete(qna_number);
	}

	@Override
	public List<MissingBoardVO> MissingMyList(Criteria cri, String MEMBERS_ID) {

		return missingBoardMapper.MissingMyList(cri,MEMBERS_ID);
	}

	@Override
	public int getMyTotal(String MEMBERS_ID) {

		return missingBoardMapper.getMyTotal(MEMBERS_ID);
	}

}
