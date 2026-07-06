package com.lcb404.mapper;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;

public interface TimeTableMapper {
	public List<TimeTableVO> getTime(Map<String, String> map);
	public TimeTableVO getPoster(int timetable_number);
	public int total(SeatNumVO seatNum);
	public TimeTableVO getDay(int timetable_number);
	public int getMovieCode(int timetable_number);
	public List<TimeTableVO> getTimeTable(int mno);
}
