package com.lcb404.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.EventVO;
import com.lcb404.mapper.EventMapper;

@Service("eventService")
public class EventServiceImpl implements EventService{

	@Autowired
	private EventMapper eventMapper;
	
	@Override
	public EventVO getEvent(int eno) {

		return eventMapper.getEvent(eno);
	}

}
