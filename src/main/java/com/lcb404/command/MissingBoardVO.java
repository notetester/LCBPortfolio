package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MissingBoardVO {

		
		private int found_number;
		private String members_id;
		private String found_place;
		private String found_hpnum1;
		private String found_hpnum2;
		private String found_hpnum3;
		private String found_email;
		private String found_title;
		private String found_content;
		private Timestamp found_regdate;
		private String Loca1="none";
		private String Loca2="none";
		private String Loca3="none";
}
