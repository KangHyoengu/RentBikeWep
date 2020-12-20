package com.rent.bike;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rent.bike.ajax.command.board.AjaxPageCommand;
import com.rent.bike.beans.AjaxList;
import com.rent.bike.beans.board.BoardDTO;

@RestController
@RequestMapping("/board")
public class AjaxBoardController {
	AjaxMaker<BoardDTO> ajax = new AjaxMaker<BoardDTO>();
	
	@GetMapping("/page")
	public AjaxList<BoardDTO> pagination(Model model, int page) {
		model.addAttribute("page", page);
		
		new AjaxPageCommand().execute(model);
		
		return ajax.buildList(model);
	}
}
