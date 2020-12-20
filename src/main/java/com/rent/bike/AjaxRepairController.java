package com.rent.bike;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.beans.AjaxList;
import com.rent.bike.beans.AjaxStatusList;
import com.rent.bike.beans.repair.RepairDTO;
import com.rent.bike.command.repair.ApplyOkCommand;

@RestController
@RequestMapping("/repair")
public class AjaxRepairController {
	AjaxMaker<RepairDTO> ajax = new AjaxMaker<RepairDTO>();
	
	@GetMapping("/page")
	public AjaxList<RepairDTO> repairPage(Model model, int page) {
		model.addAttribute("page", page);
		
		return ajax.buildList(model);
	}
	
	@PostMapping("/apply")
	public AjaxStatusList applyRepair(Model model, RepairDTO dto) {
		model.addAttribute("dto", dto);
		
		new ApplyOkCommand().execute(model);
		
		return ajax.buildStatusList(model);
	}
}
