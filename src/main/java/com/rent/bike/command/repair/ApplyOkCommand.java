package com.rent.bike.command.repair;

import org.springframework.ui.Model;

import com.rent.bike.beans.repair.RepairDAO;
import com.rent.bike.beans.repair.RepairDTO;

import common.C;
import common.Command;

public class ApplyOkCommand implements Command {

	@Override
	public void execute(Model model) {
		RepairDAO dao = C.sqlSession.getMapper(RepairDAO.class);
		int result = 0;
		
		RepairDTO dto = (RepairDTO)model.getAttribute("dto");
		
		try {
			result = dao.applyRepair(dto);
			
			model.addAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
