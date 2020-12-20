package com.rent.bike.beans.repair;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class RepairDTO {
	private int repairno;
	private String bikeno;
	private String rtitle;
	private int rcategory;
	private String rcontent;
	private String regdate;
	private int rstatus;
	private int mno;
	private String rimg;
	private String mid;
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(regdate);
	}
}
