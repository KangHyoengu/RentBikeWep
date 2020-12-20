package com.rent.bike.beans.member;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.rent.bike.beans.AjaxStatusList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AjaxMemberList extends AjaxStatusList{
	@JsonProperty("data")
	private List<MemberDTO> list; 
}
