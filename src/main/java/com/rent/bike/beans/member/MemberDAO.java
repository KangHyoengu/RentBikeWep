package com.rent.bike.beans.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface MemberDAO {
	public int signUp(MemberDTO dto);
	public int memberAuth(@Param("mno") int mno, @Param("mauth") String mauth);
	public List<MemberDTO> emailOk(@Param("email") String email);
	public List<MemberDTO> idOk(@Param("id") String id);
}
