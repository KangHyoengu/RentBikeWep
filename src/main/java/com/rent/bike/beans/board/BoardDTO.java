package com.rent.bike.beans.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

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
	private List<BoardImagesDTO> images;
	private List<BoardCommentDTO> comments;
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd").format(regdate);
	}
}
