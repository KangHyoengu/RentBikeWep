package com.rent.bike;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.ajax.command.member.AjaxIdOkCommand;
import com.rent.bike.ajax.command.member.AjaxInfoChangeCommand;
import com.rent.bike.ajax.command.member.AjaxUserInfoCommand;
import com.rent.bike.beans.AjaxList;
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
	
	@GetMapping("/user_info")
	public AjaxList<MemberDTO> userInfo(Model model, String mid) {
		model.addAttribute("mid", mid);
		
		new AjaxUserInfoCommand().execute(model);
		
		return ajax.buildList(model);
	}
	
	@PostMapping("infoChange")
	public AjaxStatusList infoChange(Model model, String mpw, String mphone, String mid) {
		model.addAttribute("mpw", mpw);
		model.addAttribute("mphone", mphone);
		model.addAttribute("mid", mid);
		
		new AjaxInfoChangeCommand().execute(model);
		
		return ajax.buildStatusList(model);
	}
}
