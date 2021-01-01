package com.rent.bike.ajax.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.admin.AdminDAO;
import com.rent.bike.beans.repair.RepairDTO;

import common.C;
import common.Command;

public class AjaxRepairDetailCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		List<RepairDTO> list = null;
		
		int repairno =  (Integer)model.getAttribute("repairno");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			list = dao.repairDetail(repairno);
			if(list.size() != 0) {
				status = "OK";
			} else {
				message.append("[리스트할 데이터가 없습니다.]");
			}
		} catch (Exception e) {
			message.append("[트렌젝션 에러 발생: " + e.getMessage() + " ]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
	}

}
