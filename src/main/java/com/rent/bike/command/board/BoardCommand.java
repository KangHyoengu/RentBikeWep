package com.rent.bike.command.board;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.board.BoardDAO;
import com.rent.bike.beans.board.BoardDTO;

import common.C;
import common.Command;

public class BoardCommand implements Command {

	@Override
	public void execute(Model model) {
		BoardDAO dao = C.sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = null;
		int start = 1, end = 10, count = 0;
		
		try {
			count = dao.countAll();
			if(count != 0) {
				list = dao.pageList(start, end);
			}
			model.addAttribute("count", count);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
