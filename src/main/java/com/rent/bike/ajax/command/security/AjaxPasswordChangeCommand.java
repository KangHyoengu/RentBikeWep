package com.rent.bike.ajax.command.security;

import org.springframework.ui.Model;

import com.rent.bike.beans.member.MemberDAO;
import com.rent.bike.security.CustomPasswordEncoder;

import common.C;
import common.Command;

public class AjaxPasswordChangeCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		CustomPasswordEncoder cpe = new CustomPasswordEncoder();
		int result = 0;
		
		String mid = (String)model.getAttribute("mid");
		String mpw = (String)model.getAttribute("mpw");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			result = dao.passwordChange(cpe.encode(mpw), mid);
			
			if(result == 0) {
				message.append("[비밀번호 다시 입력]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			message.append("[트렌젝션 에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", result);
	}

}
