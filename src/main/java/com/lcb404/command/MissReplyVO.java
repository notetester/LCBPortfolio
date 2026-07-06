package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MissReplyVO {
	private int mrno;
	private int mno;
	private int total;
	
	private String reply;
	private String replyId;
	private String replyPw;
	private Timestamp replyDate;
}
