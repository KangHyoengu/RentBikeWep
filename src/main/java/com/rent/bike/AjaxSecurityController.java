package com.rent.bike;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.ajax.command.security.AjaxFindCommand;
import com.rent.bike.ajax.command.security.AjaxPasswordChangeCommand;
import com.rent.bike.beans.AjaxStatusList;
import com.rent.bike.beans.member.MemberDTO;

@RestController
@RequestMapping("security")
public class AjaxSecurityController {
	HashMap<String, String> authCode = new HashMap<String, String>();
	AjaxMaker<MemberDTO> ajax = new AjaxMaker<MemberDTO>();
	
	@PostMapping("find")
	public AjaxStatusList find(HttpServletRequest request, ModelMap mo, Model model, String mid, String memail) {
		model.addAttribute("mid", mid);
		model.addAttribute("memail", memail);
		
		new AjaxFindCommand().execute(model);
		
		@SuppressWarnings("unchecked")
		List<MemberDTO> list = (List<MemberDTO>)model.getAttribute("list");
		
		int result = 0;
		
		if(list.size() != 0) {
			JavaMailSender jms = new JavaMailSender();
			
			try {
				String code = jms.mailSender(request, mo, list.get(0).getMemail());
				authCode.put(list.get(0).getMemail(), code);
				result = 1;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("[result]: "+result);
		model.addAttribute("result", result);
		
		return ajax.buildStatusList(model);
	}
	
	@GetMapping("/check")
	public AjaxStatusList check(Model model, String code, String memail) {
		String message = "";
		String status = "FAIL";
		int result = 0;
		
		if(authCode.get(memail).equals(code)) {
			status = "OK";
			result = 1;
		} else {
			message = "[아이디 또는 이메일이 일치하지 않습니다.]";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("status", status);
		model.addAttribute("result", result);
		
		return ajax.buildStatusList(model);
	}
	
	@PostMapping("/pwChange")
	public AjaxStatusList pwChange(Model model, String mpw, String mid) {
		model.addAttribute("mpw", mpw);
		model.addAttribute("mid", mid);
		
		new AjaxPasswordChangeCommand().execute(model);
		
		return ajax.buildStatusList(model);
	}
}
