package com.lcb404.command;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TimeTableVO {
	private int timetable_number;
	private String cinema_code;
	private int movie_code;
	private String members_id;
	private int timetable_hole;
	private int timetable_totalseat;
	private Timestamp timetable_start;
	private Timestamp timetable_end;
	private Timestamp timetable_regdate;
}
