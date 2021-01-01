package com.rent.bike;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.rent.bike.beans.board.BoardDTO;
import com.rent.bike.command.board.BoardCommand;
import com.rent.bike.command.board.WriteCommand;

@Controller
@RequestMapping("/board")
public class BoardContoller {
	
	@GetMapping("")
	public String board(Model model) {
		new BoardCommand().execute(model);
		
		return "board/board";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request, MultipartFile[] upload, Model model, BoardDTO dto) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/board");
		String[] savedName = null;
		
		try {
			if(upload.length != 0) {
				savedName = new String[upload.length];
				
				for (int i = 0; i < upload.length; i++) {
					savedName[i] = upload[i].getOriginalFilename();
					savedName[i] = uploadFile(savedName[i], upload[i].getBytes(), uploadPath);
					upload[i].transferTo(new File(uploadPath + "/" + savedName));
				}
			} 
			
		} 
		catch (IOException e) {
			e.printStackTrace();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("images", savedName);
		model.addAttribute("dto", dto);
		
		new WriteCommand().execute(model);
		
		return "board/write";
	}
	
	private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
	      UUID uuid = UUID.randomUUID();
	      
	      String savedName = uuid.toString()+"_"+originalName;
	      File target = new File(uploadPath, savedName);
	      FileCopyUtils.copy(fileData, target);
	      
	      return savedName;
	}
}
