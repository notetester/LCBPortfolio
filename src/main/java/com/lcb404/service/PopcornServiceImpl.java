package com.lcb404.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.PopcornVO;
import com.lcb404.mapper.PopcornMapper;

@Service("popcornService")
public class PopcornServiceImpl implements PopcornService{

	@Autowired
	private PopcornMapper popcornMapper;
	
	@Override
	public PopcornVO getList(int POPCORN_CODE) {

		return popcornMapper.getList(POPCORN_CODE);
	}

}
