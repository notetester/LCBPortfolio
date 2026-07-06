package com.lcb404.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.ReserveVO;
import com.lcb404.command.SeatNumVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.utill.Criteria;


public interface ReserveMapper {
	public int setSeat(@Param("seatNum") SeatNumVO seatNum,@Param("MEMBERS_ID") String MEMBERS_ID);
	public List<ReserveVO> getList(int timetable_number);	
	public int getTicket(String MEMBERS_ID);
	public List<ReserveVO> getHistory(@Param("MEMBERS_ID") String MEMBERS_ID,@Param("cri") Criteria cri);
	public int getTotal(String MEMBERS_ID);
	public int getMovieReserve(int timetable_number);	
	public int getTotalAll();
}
