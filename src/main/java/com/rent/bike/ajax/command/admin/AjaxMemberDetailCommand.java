package com.rent.bike.ajax.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.admin.AdminDAO;
import com.rent.bike.beans.member.MemberDTO;

import common.C;
import common.Command;

public class AjaxMemberDetailCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		List<MemberDTO> list = null;
		
		int mno = (Integer) model.getAttribute("mno");
		
		StringBuffer message = new  StringBuffer();
		String status = "FAIL";
		
		try {
			list = dao.memberDetail(mno);
			
			if(list.size() == 0) {
				message.append("[회원정보를 불러올수 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트렌젝션 에러: " + e.getMessage() + " ]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
	}

}
