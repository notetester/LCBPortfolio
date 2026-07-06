package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QNABoardVO {
	
	private int qna_number;
	private String members_id;
	private String qna_place;
	private String qna_hpnum1;
	private String qna_hpnum2;
	private String qna_hpnum3;
	private String qna_email;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_regdate;
	
}
