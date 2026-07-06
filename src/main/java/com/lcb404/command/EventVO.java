package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventVO {

	private int EVENT_CODE;
	private String MEMBERS_ID;
	private String EVENT_TITLE;
	private String EVENT_URL;
	private Timestamp EVENT_STARTDATE;
	private Timestamp EVENT_ENDDATE;
	
}
