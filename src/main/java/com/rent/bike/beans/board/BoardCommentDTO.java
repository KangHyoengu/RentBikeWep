package com.rent.bike.beans.board;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentDTO {
	private int cno;
	private int bno;
	private int mno;
	private String mid;
	private String ccontent;
	private double regdate;
	
	public void setRegdate(Timestamp regdate) {
		Date now = new Date();
		this.regdate = now.getTime() - regdate.getTime();
	}
}
