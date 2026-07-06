package com.lcb404.mapper;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.UserVO;

public interface UserMapper {
	public int IdCheck(String MEMBERS_ID); //아이디중복확인
	public int join(UserVO vo); //회원가입
	public int login(UserVO vo); //로그인
	public UserVO userInfo(String MEMBERS_ID); //회원정보
	public String getPw(UserVO vo);
	public String getId(UserVO vo);
	
	public int delete(@Param("MEMBERS_ID") String MEMBERS_ID,@Param("pw") String pw);
	public int Update(UserVO vo);
	public int updatePoint(UserVO vo);
	public int Kakaojoin(UserVO vo);
	public int statusCheck(String MEMBERS_ID);
	public int getGrade(String MEMBERS_ID);
}
