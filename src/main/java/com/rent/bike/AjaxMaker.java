package com.rent.bike;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.AjaxList;
import com.rent.bike.beans.AjaxStatusList;

public class AjaxMaker<T> {
	public AjaxStatusList buildStatusList(Model model) {
		AjaxStatusList result = new AjaxStatusList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setCount((Integer)model.getAttribute("result"));
		
		return result;
	}
	
	public AjaxList<T> buildList(Model model) {
		AjaxList<T> result = new AjaxList<T>();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>)model.getAttribute("list");
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		} else {
			result.setCount(0);
		}
		return result;
	}
}
