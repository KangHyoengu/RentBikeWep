package com.rent.bike.ajax.command.board;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.board.BoardDAO;
import com.rent.bike.beans.board.BoardDTO;

import common.C;
import common.Command;

public class AjaxPageCommand implements Command {

	@Override
	public void execute(Model model) {
		BoardDAO dao = C.sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = null;
		int page = (Integer) model.getAttribute("page");

		int start = ((page - 1) * 10) + 1;
		int end = page * 10;

		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			list = dao.pageList(start, end);
			
			if (list.size() != 0) {
				status = "OK";
			} else {
				message.append("[리스트할 데이터가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트렌젝션 에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("status", status); 
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
	}

}
