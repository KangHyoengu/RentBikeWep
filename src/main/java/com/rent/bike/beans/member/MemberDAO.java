package com.rent.bike.beans.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface MemberDAO {
	// 회원 가입
	public int signUp(MemberDTO dto);
	// 회원 가입 권한 부여
	public int memberAuth(@Param("mno") int mno, @Param("mauth") String mauth);
	// 회원 정보 수정
	public int infoChange(@Param("mpw") String mpw, @Param("mphone") String mphone, @Param("mid") String mid);
	// 비밀번호 변경
	public int passwordChange(@Param("mpw") String mpw, @Param("mid") String mid);
	// 아이디 중복 확인
	public List<MemberDTO> idOk(@Param("mid") String mid);
	// 회원 정보 확인
	public List<MemberDTO> info(@Param("mid") String mid);
	// 비밀번호 찾기(아이디 이메일 체크)
	public List<MemberDTO> search(@Param("mid")String mid, @Param("memail") String memail);
}
