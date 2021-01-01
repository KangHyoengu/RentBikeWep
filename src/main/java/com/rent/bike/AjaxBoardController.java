package com.rent.bike;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.ajax.command.board.AjaxCommentCommand;
import com.rent.bike.ajax.command.board.AjaxDetailCommand;
import com.rent.bike.ajax.command.board.AjaxPageCommand;
import com.rent.bike.beans.AjaxList;
import com.rent.bike.beans.board.BoardCommentDTO;
import com.rent.bike.beans.board.BoardDTO;

@RestController
@RequestMapping("/board")
public class AjaxBoardController {
	AjaxMaker<BoardDTO> ajax = new AjaxMaker<BoardDTO>();
	
	// 페이징
	@GetMapping("/page")
	public AjaxList<BoardDTO> pagination(Model model, int page) {
		model.addAttribute("page", page);
		
		new AjaxPageCommand().execute(model);
		
		return ajax.buildList(model);
	}
	
	// 상세페이지 게시글 가져오기
	@GetMapping("/detail")
	public AjaxList<BoardDTO> bcontent(Model model, int bno){
		model.addAttribute("bno", bno);
		
		new AjaxDetailCommand().execute(model);
		
		return ajax.buildList(model);
	}
	
	@PostMapping("/comment")
	public AjaxList<BoardCommentDTO> comment(Model model, BoardCommentDTO dto) {
		AjaxMaker<BoardCommentDTO> comment = new AjaxMaker<BoardCommentDTO>();
		
		model.addAttribute("dto", dto);
		
		new AjaxCommentCommand().execute(model);
		
		return comment.buildList(model);
	}
}
