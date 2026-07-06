package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QNAReplyVO {

	private int qrno;
	private int qno;
	private int total;
	
	private String reply;
	private String replyId;
	private String replyPw;
	private Timestamp replyDate;
}
