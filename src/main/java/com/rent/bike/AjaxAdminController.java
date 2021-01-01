package com.rent.bike;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.ajax.command.admin.AjaxMemberDeleteCommand;
import com.rent.bike.ajax.command.admin.AjaxMemberDetailCommand;
import com.rent.bike.ajax.command.admin.AjaxMemberSearchCommand;
import com.rent.bike.ajax.command.admin.AjaxMemberUpdateCommand;
import com.rent.bike.ajax.command.admin.AjaxNowPageCommand;
import com.rent.bike.ajax.command.admin.AjaxRepairDetailCommand;
import com.rent.bike.ajax.command.admin.AjaxRepairStatusCommand;
import com.rent.bike.beans.AjaxList;
import com.rent.bike.beans.AjaxStatusList;
import com.rent.bike.beans.member.MemberDTO;
import com.rent.bike.beans.repair.RepairDTO;

@RestController
@RequestMapping("/admin")
public class AjaxAdminController {
	AjaxMaker<RepairDTO> ajax = new AjaxMaker<RepairDTO>();
	AjaxMaker<MemberDTO> mAjax = new AjaxMaker<MemberDTO>();
	
	@GetMapping("/page")
	public AjaxList<RepairDTO> nowPage(Model model, int nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		new AjaxNowPageCommand().execute(model);
		
		return ajax.buildList(model);
	}
	
	@GetMapping("/detail")
	public AjaxList<RepairDTO> detail(Model model, int repairno){
		model.addAttribute("repairno", repairno);
		
		new AjaxRepairDetailCommand().execute(model);
		
		return ajax.buildList(model);
	}
	
	@PutMapping("/status")
	public AjaxStatusList status(Model model, Integer repairno) {
		model.addAttribute("repairno", repairno);
		
		new AjaxRepairStatusCommand().execute(model);
		
		return ajax.buildStatusList(model);
	}
	
	@GetMapping("/search")
	public AjaxList<MemberDTO> memberSearch(Model model, String search) {
		model.addAttribute("search", search);
		
		new AjaxMemberSearchCommand().execute(model);
		
		return mAjax.buildList(model);
	}
	
	@GetMapping("memberDetail")
	public AjaxList<MemberDTO> memberDetail(Model model, int mno) {
		model.addAttribute("mno", mno);
		
		new AjaxMemberDetailCommand().execute(model);
		
		return mAjax.buildList(model);
	}
	
	@DeleteMapping("/deleteMember")
	public AjaxStatusList deleteMember(Model model, int mno) {
		model.addAttribute("mno", mno);
		
		new AjaxMemberDeleteCommand().execute(model);
		
		return mAjax.buildStatusList(model);
	}
	
	@PutMapping("/updateMember")
	public AjaxStatusList updateMember(Model model, String mname, String memail, String mphone, int mno) {
		model.addAttribute("mname", mname);
		model.addAttribute("memail", memail);
		model.addAttribute("mphone", mphone);
		model.addAttribute("mno", mno);
		
		new AjaxMemberUpdateCommand().execute(model);
		
		return mAjax.buildStatusList(model);
	}
}
