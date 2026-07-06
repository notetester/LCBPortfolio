package com.lcb404.service;



import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.mapper.ReserveMapper;
import com.lcb404.mapper.TimeTableMapper;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private TimeTableMapper timeTableMapper;
	
	@Override
	public int setSeat(SeatNumVO seatNum,String MEMBERS_ID) {

		return reserveMapper.setSeat(seatNum,MEMBERS_ID);
	}

	@Override
	public List<ReserveVO> getList(int timetable_number) {

		return reserveMapper.getList(timetable_number);
	}

	@Override
	public List<TimeTableVO> getTime(String day) {

		//String date = "2020-08-"+day;
		
//		Date d = Date.valueOf(date);
		Map<String,String> map = new HashMap<>();
		
		map.put("day",day);
		
		
		return timeTableMapper.getTime(map);
	}

	@Override
	public TimeTableVO getPoster(int timetable_number) {

		return timeTableMapper.getPoster(timetable_number);
	}

	@Override
	public int total(SeatNumVO seatNum) {

		return timeTableMapper.total(seatNum);
	}

	@Override
	public int getMovieCode(int timetable_number) {

		return timeTableMapper.getMovieCode(timetable_number);
	}

	@Override
	public int getMovieReserve(int timetable_number) {
		
		return reserveMapper.getMovieReserve(timetable_number);
	}
	
	@Override
	public List<TimeTableVO> getTimeTable(int mno) {

		return timeTableMapper.getTimeTable(mno);
	}

	@Override
	public int getTotal() {

		return reserveMapper.getTotalAll();
	}

}
