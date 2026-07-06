package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MovieVO {
	private int MOVIE_CODE;
	private String MEMBERS_ID;
	private String MOVIE_TITLE;
	private double MOVIE_person;
	private double Reserve_Rate;
	private int stack_count;
	private String MOVIE_CONTENT1;
	private String MOVIE_CONTENT2;
	private String MOVIE_preference;
	private String MOVIE_IMAGE;
	private Timestamp MOVIE_REGDATE;
	private int MOVIE_HIT;
	
}
