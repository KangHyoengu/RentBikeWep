package com.rent.bike;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.bike.command.admin.AdminRepairCommand;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@GetMapping("/adminRepair")
	public String adminRepair(Model model) {
		new AdminRepairCommand().execute(model);
		
		return "admin/repair";
	}
	
	@GetMapping("/adminMember")
	public void adminMember() {
		
	}
}
