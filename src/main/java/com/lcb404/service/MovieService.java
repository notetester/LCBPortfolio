package com.lcb404.service;

import com.lcb404.command.MovieVO;

public interface MovieService {
	public MovieVO getList(int MOVIE_CODE);
	public int movieLike(MovieVO vo, String MEMBERS_ID);
	public int updateLike(MovieVO vo);
	public int updateRate(double result,int mno);
}
