package com.rent.bike.command.board;

import org.springframework.ui.Model;

import com.rent.bike.beans.board.BoardDAO;
import com.rent.bike.beans.board.BoardDTO;

import common.C;
import common.Command;

public class WriteCommand implements Command {

	@Override
	public void execute(Model model) {
		BoardDAO dao = C.sqlSession.getMapper(BoardDAO.class);
		String[] images = (String[])model.getAttribute("images");
		BoardDTO dto = (BoardDTO)model.getAttribute("dto");
		
		int result = 0, num1 = 0, num2 = 0;
		
		try {
			num1 = dao.insert(dto);
			
			if(images.length != 0) {
				num2 = dao.insertImages(images, dto.getBno());
			}
			
			if(num1 != 0 && num2 != 0) {
				result = 1;
			}
		} catch (Exception e) {
			System.out.println("[트렌젝션 에러: "+e.getMessage()+" ]");
		}
		
		
		model.addAttribute("result", result);
	}

}
