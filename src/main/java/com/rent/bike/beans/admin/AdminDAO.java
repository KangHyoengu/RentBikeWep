package com.rent.bike.beans.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.rent.bike.beans.member.MemberDTO;
import com.rent.bike.beans.repair.RepairDTO;

@MapperScan
public interface AdminDAO {
	// 수리신청 리스트
	public List<RepairDTO> repairList(@Param("start") int start, @Param("end") int end);
	// 수리 신청 상세정보
	public List<RepairDTO> repairDetail(@Param("repairno") int repairno);
	// 검색 회원 리스트 가져오기
	public List<MemberDTO> memberList(@Param("search") String search);
	// 회원 상세 정보
	public List<MemberDTO> memberDetail(@Param("mno") int mno);
	// 리스트 전체 개수
	public int countAll();
	// 수리 완료
	public int success(@Param("repairno") int repairno);
	// 회원 정보 수정
	public int updateMember(@Param("memail") String memail, @Param("mname") String mname, @Param("mphone") String mphone, @Param("mno") int mno);
	// 회원 탈퇴
	public int deleteMember(@Param("mno") int mno);
}
