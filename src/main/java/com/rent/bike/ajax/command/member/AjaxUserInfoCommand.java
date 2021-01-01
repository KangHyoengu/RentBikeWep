package com.rent.bike.ajax.command.member;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.member.MemberDAO;
import com.rent.bike.beans.member.MemberDTO;

import common.C;
import common.Command;

public class AjaxUserInfoCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		List<MemberDTO> list = null;
		
		String mid = (String)model.getAttribute("mid");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			list = dao.info(mid);
			
			if(list.size() == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			message.append("[트렌젝션 에러 발생: " + e.getMessage() + " ]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
	}

}
