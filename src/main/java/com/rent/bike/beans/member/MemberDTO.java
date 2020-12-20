package com.rent.bike.beans.member;

import lombok.Data;

@Data
public class MemberDTO {
	private int mno;
	private String mid;
	private String mpw;
	private String memail;
	private String mname;
	private String mbirth;
	private int mgender;
	private String mphone;
	private char enabled = '1';
}
