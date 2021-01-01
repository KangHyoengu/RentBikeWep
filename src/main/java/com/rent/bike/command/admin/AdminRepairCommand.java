package com.rent.bike.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.admin.AdminDAO;
import com.rent.bike.beans.repair.RepairDTO;

import common.C;
import common.Command;

public class AdminRepairCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		List<RepairDTO> list = null;
		int totalPage = 0;
		
		try {
			list = dao.repairList(1, 10);
			totalPage = dao.countAll();
			
			if(totalPage % 10 == 0) {
				totalPage /= 10;
			} else {
				totalPage = totalPage / 10 + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalPage", totalPage);
	}

}
