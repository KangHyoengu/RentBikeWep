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

import com.rent.bike.command.board.BoardCommand;

@Controller
@RequestMapping("/board")
public class BoardContoller {
	
	@GetMapping("")
	public String board(Model model) {
		new BoardCommand().execute(model);
		
		return "board/board";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request, MultipartFile upload, Model model) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/apply");
		String savedName = "";
		
		try {
			if(!upload.getOriginalFilename().equals("")) {
				System.out.println(upload.toString());
//				savedName = upload.getOriginalFilename();
//				savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
//				upload.transferTo(new File(uploadPath + "/" + savedName));
			} 
			
		} 
//		catch (IOException e) {
//			e.printStackTrace();
//		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
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
