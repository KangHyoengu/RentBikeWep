package com.rent.bike.beans.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class BoardDTO {
	private int bno;
	private int mno;
	private String btitle;
	private String bcontent;
	private int bview;
	private String regdate;
	private String mid;
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(regdate);
	}
}
