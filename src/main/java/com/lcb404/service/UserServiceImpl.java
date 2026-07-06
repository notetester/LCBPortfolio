package com.lcb404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.MovieVO;
import com.lcb404.command.ReserveVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.command.UserVO;
import com.lcb404.mapper.MovieMapper;
import com.lcb404.mapper.ReserveMapper;
import com.lcb404.mapper.TimeTableMapper;
import com.lcb404.mapper.UserMapper;
import com.lcb404.utill.Criteria;
@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private TimeTableMapper timeTableMapper;	

	@Autowired
	private MovieMapper movieMapper;
	
	@Override
	public int IdCheck(String MEMBERS_ID) {

		return userMapper.IdCheck(MEMBERS_ID);
	}

	@Override
	public int join(UserVO vo) {

		return userMapper.join(vo);
	}

	@Override
	public int login(UserVO vo) {

		return userMapper.login(vo);
	}

	@Override
	public UserVO userInfo(String MEMBERS_ID) {

		return userMapper.userInfo(MEMBERS_ID);
	}

	

	@Override
	public int delete(String MEMBERS_ID,String pw) {
		
		return userMapper.delete(MEMBERS_ID,pw);
	}

	@Override
	public int Update(UserVO vo) {
		
		return userMapper.Update(vo);
	}

	@Override
	public int Kakaojoin(UserVO vo) {
		
		return userMapper.Kakaojoin(vo);
	}

	@Override
	public int statusCheck(String MEMBERS_ID) {
		
		return userMapper.statusCheck(MEMBERS_ID);
	}

	@Override
	public int getGrade(String MEMBERS_ID) {
		
		return userMapper.getGrade(MEMBERS_ID);
	}

	@Override
	public int getTicket(String MEMBERS_ID) {

		return reserveMapper.getTicket(MEMBERS_ID);
	}

	@Override
	public List<ReserveVO> getHistory(String MEMBERS_ID, Criteria cri) {

		return reserveMapper.getHistory(MEMBERS_ID, cri);
	}

	@Override
	public TimeTableVO getDay(int Timetable_number) {

		return timeTableMapper.getDay(Timetable_number);
	}

	@Override
	public MovieVO getMovie(int MOVIE_CODE) {

		return movieMapper.getList(MOVIE_CODE);
	}

	@Override
	public int getTotal(String MEMBERS_ID) {

		return reserveMapper.getTotal(MEMBERS_ID);
	}

	@Override
	public int updatePoint(UserVO vo) {

		return userMapper.updatePoint(vo);
	}

	@Override
	public String getPw(UserVO vo) {

		return userMapper.getPw(vo);
	}

	@Override
	public String getId(UserVO vo) {

		return userMapper.getId(vo);
	}

}
