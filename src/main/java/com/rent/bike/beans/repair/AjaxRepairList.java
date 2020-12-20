package com.rent.bike.beans.repair;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.rent.bike.beans.AjaxStatusList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AjaxRepairList extends AjaxStatusList {
	@JsonProperty("data")
	List<RepairDTO> list;
}
