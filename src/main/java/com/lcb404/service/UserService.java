package com.lcb404.service;

import java.util.List;

import com.lcb404.command.MovieVO;
import com.lcb404.command.ReserveVO;
import com.lcb404.command.TimeTableVO;
import com.lcb404.command.UserVO;
import com.lcb404.utill.Criteria;

public interface UserService {
	public int IdCheck(String MEMBERS_ID); //아이디중복확인
	public int join(UserVO vo); //회원가입
	public int login(UserVO vo); //로그인
	
	public UserVO userInfo(String MEMBERS_ID); //회원정보
	public int delete(String MEMBERS_ID,String pw);
	public int Update(UserVO vo);
	public String getPw(UserVO vo);
	public String getId(UserVO vo);
	
	public int getTicket(String MEMBERS_ID);
	public List<ReserveVO> getHistory(String MEMBERS_ID, Criteria cri);
	public TimeTableVO getDay(int Timetable_number);
	public MovieVO getMovie(int MOVIE_CODE);
	public int getTotal(String MEMBERS_ID);
	public int updatePoint(UserVO vo);
	
	public int Kakaojoin(UserVO vo);
	public int statusCheck(String MEMBERS_ID);
	public int getGrade(String MEMBERS_ID);
}
