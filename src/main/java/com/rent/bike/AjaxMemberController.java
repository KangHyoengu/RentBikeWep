package com.rent.bike;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.ajax.command.member.AjaxIdOkCommand;
import com.rent.bike.beans.AjaxStatusList;
import com.rent.bike.beans.member.MemberDTO;

@RestController
@RequestMapping("/member")
public class AjaxMemberController {
	
	AjaxMaker<MemberDTO> ajax = new AjaxMaker<MemberDTO>();
	
	@GetMapping("/idOk")
	public AjaxStatusList idOk(String id, Model model) {
		model.addAttribute("id", id);
		
		new AjaxIdOkCommand().execute(model);
		
		return ajax.buildStatusList(model);
	}
}
