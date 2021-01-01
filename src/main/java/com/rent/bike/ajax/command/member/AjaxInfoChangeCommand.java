package com.rent.bike.ajax.command.member;

import org.springframework.ui.Model;

import com.rent.bike.beans.member.MemberDAO;
import com.rent.bike.security.CustomPasswordEncoder;

import common.C;
import common.Command;

public class AjaxInfoChangeCommand implements Command {

	@Override
	public void execute(Model model) {
		CustomPasswordEncoder cpe = new CustomPasswordEncoder();
		
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		int result = 0;
		
		String mpw = (String)model.getAttribute("mpw");
		String mphone = (String)model.getAttribute("mphone");
		String mid = (String)model.getAttribute("mid");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			mpw = cpe.encode(mpw);
			
			result = dao.infoChange(mpw, mphone, mid);
			if(result == 0) {
				message.append("[회원 정보 수정 실패]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트렌젝션 에러 발생: " + e.getMessage() + " ]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", result);
	}

}
