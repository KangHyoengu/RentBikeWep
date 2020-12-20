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

import com.rent.bike.beans.repair.RepairDTO;
import com.rent.bike.command.repair.ApplyOkCommand;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	
	@GetMapping("")
	public String apply() {
		return "apply/apply_repair";
	}
	
	@PostMapping("/applyOk")
	public String applyOk(HttpServletRequest request, MultipartFile upload, Model model, RepairDTO dto) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/apply");
		String savedName = "";
		
		try {
			if(!upload.getOriginalFilename().equals("")) {
				savedName = upload.getOriginalFilename();
				savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
				upload.transferTo(new File(uploadPath + "/" + savedName));
			} 
			
			dto.setRimg(savedName);
			
			model.addAttribute("dto", dto);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		new ApplyOkCommand().execute(model);
		
		return "apply/applyOk";
	}
	
	private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
	      UUID uuid = UUID.randomUUID();
	      
	      String savedName = uuid.toString()+"_"+originalName;
	      File target = new File(uploadPath, savedName);
	      FileCopyUtils.copy(fileData, target);
	      
	      return savedName;
	}
}
