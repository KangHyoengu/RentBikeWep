package com.rent.bike.ajax.command.board;

import java.util.List;

import org.springframework.ui.Model;

import com.rent.bike.beans.board.BoardCommentDTO;
import com.rent.bike.beans.board.BoardDAO;
import com.rent.bike.beans.board.BoardDTO;
import com.rent.bike.beans.board.BoardImagesDTO;

import common.C;
import common.Command;

public class AjaxDetailCommand implements Command {

	@Override
	public void execute(Model model) {
		BoardDAO dao = C.sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = null;
		List<BoardImagesDTO> images = null;
		List<BoardCommentDTO> comments = null;
		
		int bno = (Integer) model.getAttribute("bno");
		int result = 0;
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			result = dao.viewCnt(bno);
			
			if(result != 0) {
				list = dao.boardDetail(bno);
				
				if(list.size() != 0) {
					images = dao.images(bno);
					comments = dao.comments(bno);
					
					if(images.size() != 0) {
						list.get(0).setImages(images);
					}
					
					if(comments.size() != 0) {
						list.get(0).setComments(comments);
					}
				}
			}
			model.addAttribute("status", status);
			model.addAttribute("message", message.toString());
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			message.append(e.getMessage());
		}
	}

}
