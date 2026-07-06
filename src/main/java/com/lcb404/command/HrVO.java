package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;



@Data
public class HrVO {

	private int hrtno;
	private String title;
	private String writer;
	private String content;
	private String userId;
	private Timestamp regdate;

}

