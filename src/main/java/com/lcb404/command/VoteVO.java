package com.lcb404.command;

import lombok.Data;

@Data
public class VoteVO {
	private int vote_num;
	private String vote_name;
	private int vote_cnt;
	private String vote_userId;
	private String vote_img;
}
