package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.NoticeBoardVO;
import com.lcb404.mapper.NoticeBoardMapper;
import com.lcb404.utill.Criteria;

@Service("noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Autowired	
	private NoticeBoardMapper noticeBoardMapper;

	@Override
	public void regist(NoticeBoardVO noticeBoardVO) {
		noticeBoardMapper.regist(noticeBoardVO);		
	}

	@Override
	public List<NoticeBoardVO> getList(Criteria cri) {

		return noticeBoardMapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return noticeBoardMapper.getTotal(cri);
	}

	@Override
	public NoticeBoardVO getContent(int tno) {

		return noticeBoardMapper.getContent(tno);
	}

	@Override
	public int getUpdate(NoticeBoardVO vo) {

		return noticeBoardMapper.getUpdate(vo);
	}

	@Override
	public int getDelete(int tno) {

		return noticeBoardMapper.getDelete(tno);
	}

}
