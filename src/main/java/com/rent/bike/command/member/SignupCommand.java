package com.rent.bike.command.member;

import org.springframework.ui.Model;

import com.rent.bike.beans.member.MemberDAO;
import com.rent.bike.beans.member.MemberDTO;
import com.rent.bike.security.CustomPasswordEncoder;

import common.C;
import common.Command;

public class SignupCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		MemberDTO dto = (MemberDTO)model.getAttribute("dto");
		int tmp1 = 0, tmp2 = 0;
		
		CustomPasswordEncoder cpe = new CustomPasswordEncoder();
		dto.setMpw(cpe.encode(dto.getMpw()));
		
		try {
			tmp1 = dao.signUp(dto);
			tmp2 = dao.memberAuth(dto.getMno(), "ROLE_MEMBER");
			
			if(tmp1 == 0 || tmp2 == 0) {
				model.addAttribute("result", 0);
			} else {
				model.addAttribute("result", 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
