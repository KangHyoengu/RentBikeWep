package com.rent.bike.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AjaxList<T> extends AjaxStatusList {
	@JsonProperty("data")
	List<T> list;
}
