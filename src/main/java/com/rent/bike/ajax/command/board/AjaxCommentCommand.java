package com.rent.bike.ajax.command.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.board.BoardCommentDTO;
import com.rent.bike.beans.board.BoardDAO;

import common.C;
import common.Command;

public class AjaxCommentCommand implements Command {

	@Override
	public void execute(Model model) {
		BoardDAO dao = C.sqlSession.getMapper(BoardDAO.class);
		BoardCommentDTO dto = (BoardCommentDTO)model.getAttribute("dto");
		List<BoardCommentDTO> list = null;
		int result = 0;
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			result = dao.insertComment(dto);
			
			if(result == 0) {
				message.append("[댓글을 작성하지 못했습니다.]");
			} else {
				list = new ArrayList<BoardCommentDTO>();
				list.add(dto);
				
				status = "OK";
			}
		} catch (Exception e) {
			message.append("[트렌젝션 에러 발생: " + e.getMessage() + "]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
	}

}
