package com.rent.bike.ajax.command.admin;

import org.springframework.ui.Model;

import com.rent.bike.beans.admin.AdminDAO;

import common.C;
import common.Command;

public class AjaxMemberUpdateCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		int result = 0;
		
		String memail = (String)model.getAttribute("memail");
		String mname = (String)model.getAttribute("mname");
		String mphone = (String)model.getAttribute("mphone");
		int mno = (Integer)model.getAttribute("mno");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			result = dao.updateMember(memail, mname, mphone, mno);
			
			if(result == 0) {
				message.append("[수정하지 못했습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트렌젝션 에러: " + e.getMessage() + " ]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", result);
	}

}
