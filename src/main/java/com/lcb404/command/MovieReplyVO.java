package com.lcb404.command;

import java.sql.Timestamp;
//import java.util.List;



import lombok.Data;

@Data
public class MovieReplyVO {
	
	private int rno;
	private int mno;
	private int total;
	private double score;
	
	private String reply;
	private String replyId;
	private String replyPw;
	private Timestamp replyDate;
	
//	private List<MovieReplyVO> list;
}
