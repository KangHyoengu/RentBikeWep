package com.rent.bike.ajax.command.admin;

import org.springframework.ui.Model;

import com.rent.bike.beans.admin.AdminDAO;

import common.C;
import common.Command;

public class AjaxRepairStatusCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		int result = 0;
		
		int repairno = (Integer)model.getAttribute("repairno");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			result = dao.success(repairno);
			
			if(result == 0) {
				message.append("[데이터를 변경하지 못했습니다.]");
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
