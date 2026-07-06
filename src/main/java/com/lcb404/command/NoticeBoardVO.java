package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeBoardVO {

	private int tno;
	private String title;
	private String writer;
	private String content;
	private String userId;
	private Timestamp regdate;
}
