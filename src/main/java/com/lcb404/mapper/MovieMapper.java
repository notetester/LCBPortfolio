package com.lcb404.mapper;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.MovieVO;

public interface MovieMapper {
	public MovieVO getList(int MOVIE_CODE);
	public int updateLike(MovieVO vo);
	public int updateScore(@Param("mno") int mno,@Param("person")  double person);
	public int updateRate(@Param("result") double result,@Param("mno") int mno);
}
