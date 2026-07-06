package com.lcb404.mapper;

import org.apache.ibatis.annotations.Param;

import com.lcb404.command.MovieVO;

public interface LikesMapper {
	public int movieLike(@Param("vo") MovieVO vo, @Param("MEMBERS_ID") String MEMBERS_ID);
	public int setLiker(@Param("vo") MovieVO vo, @Param("MEMBERS_ID") String MEMBERS_ID);
}
