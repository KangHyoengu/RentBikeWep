package com.rent.bike;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/security")
public class SecurityController {
	HashMap<String, String> authCode = new HashMap<String, String>();
	
	@GetMapping("/accessError")
	public void accessError() {}
	
	@RequestMapping("/login")
	public void login(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "Login Error Check your account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
	}
	
	@PostMapping("/logout")
	public void logoutGET() {}
	
	@PostMapping("/passwordChange")
	public String passwordChange(Model model, String mid) {
		model.addAttribute("mid", mid);
		
		return "security/passwordChange";
	}
}
