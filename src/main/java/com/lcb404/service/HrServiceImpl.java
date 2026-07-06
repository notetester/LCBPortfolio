package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.HrVO;
import com.lcb404.mapper.HrMapper;
import com.lcb404.utill.Criteria;

@Service("hrService")
public class HrServiceImpl implements HrService {

	@Autowired
	private HrMapper hrMapper;
	
	@Override
	public void regist(HrVO hrVO) {
	
		hrMapper.regist(hrVO);
	}

	@Override
	public List<HrVO> getList(Criteria cri) {

		return hrMapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return hrMapper.getTotal(cri);
	}

	@Override
	public HrVO getContent(int hrtno) {
	
		return hrMapper.getContent(hrtno);
	}

	@Override
	public int getUpdate(HrVO vo) {
	
		return hrMapper.getUpdate(vo);
	}

	@Override
	public int getDelete(int hrtno) {

		return hrMapper.getDelete(hrtno);
	}


}
