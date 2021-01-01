package com.rent.bike.ajax.command.security;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.member.MemberDAO;
import com.rent.bike.beans.member.MemberDTO;

import common.C;
import common.Command;

public class AjaxFindCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		List<MemberDTO> list = null;
		
		String mid = (String)model.getAttribute("mid");
		String memail = (String)model.getAttribute("memail");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			list = dao.search(mid, memail);
			
			if(list.size() != 0) {
				status = "OK";
			} else {
				message.append("[리스트할 데이터가 없습니다.]");
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
