package com.lcb404.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcb404.command.MovieVO;
import com.lcb404.mapper.LikesMapper;
import com.lcb404.mapper.MovieMapper;
@Service("movieService")
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;
	
	@Autowired
	private LikesMapper likesMapper;
	
	@Override
	public MovieVO getList(int MOVIE_CODE) {

		return movieMapper.getList(MOVIE_CODE);
	}

	@Override
	public int movieLike(MovieVO vo,String MEMBERS_ID) {

		int result = likesMapper.movieLike(vo,MEMBERS_ID);
		
		if(result==1) { //누른 회원
			 return 0;
		}else { // 안누른 회원
			likesMapper.setLiker(vo,MEMBERS_ID);
			return 1;
		}
		
	}

	@Override
	public int updateLike(MovieVO vo) {
		
		return movieMapper.updateLike(vo);
	}

	@Override
	public int updateRate(double result,int mno) {

		return movieMapper.updateRate(result,mno);
	}
	
}
