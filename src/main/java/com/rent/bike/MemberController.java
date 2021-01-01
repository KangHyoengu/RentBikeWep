package com.rent.bike;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.bike.beans.member.MemberDTO;
import com.rent.bike.command.member.SignupCommand;

import common.C;

@Controller
@RequestMapping("/member")
public class MemberController {
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	// 회원 가입 페이지
	@RequestMapping("/join")
	public String signUp() {
		
		return "member/signUp";
	}
	
	// 회원 가입 승인
	@PostMapping("/joinOk")
	public String signUpOk(MemberDTO dto, Model model) {
		model.addAttribute("dto", dto);
		
		new SignupCommand().execute(model);
		
		return "member/signUpOk";
	}
	
	// 회원 정보 페이지
	@GetMapping("info")
	public String info() {
		return "member/info";
	}
}
