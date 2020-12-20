package com.rent.bike.beans.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class BoardCommentDTO {
	private int cno;
	private int bno;
	private int mno;
	private String ccontent;
	private String regdate;
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(regdate);
	}
}
