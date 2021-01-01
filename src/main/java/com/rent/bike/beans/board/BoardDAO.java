package com.rent.bike.beans.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface BoardDAO {
	// 한 페이지에 보여주는 게시글 리스트
	public List<BoardDTO> pageList(@Param("start") int start, @Param("end") int end);
	// 게시글 상세 보기
	public List<BoardDTO> boardDetail(@Param("bno") int bno);
	// 한 게시글에 있는 댓글
	public List<BoardCommentDTO> comments(@Param("bno") int bno);
	// 한 게시글에 있는 이미지
	public List<BoardImagesDTO> images(@Param("bno") int bno);
	// 게시글 작성
	public int insert(BoardDTO dto);
	// 이미지 저장
	public int insertImages(@Param("images") String[] images, @Param("bno") int bno);
	// 댓글 작성
	public int insertComment(BoardCommentDTO dto);
	// 게시글 삭제
	public int delete(@Param("bno") int bno);
	// 게시글 수정
	public int update(@Param("btitle") String btitle, @Param("bcontent") String bcontent, @Param("bno") int bno);
	// 전체 게시글 수
	public int countAll();
	// 게시글 조회수 업
	public int viewCnt(@Param("bno") int bno);
}
