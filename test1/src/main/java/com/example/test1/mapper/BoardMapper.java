package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(HashMap<String, Object> map) throws Exception; 
	int selectBoardCnt();
	// 삭제
	void deleteBoard(HashMap<String, Object> map);
	// 수정
	void updateBoard(HashMap<String, Object> map);
	// 삽입
	void insertBoard(HashMap<String, Object> map);
	// 이미지 삽입
	void insertBoardImg(HashMap<String, Object> map);
	// 게시글 정보
	Board selectGetBoard(HashMap<String, Object> map);
	// 조회수
	void updateCnt(HashMap<String, Object> map);
	// 댓글
	void insertComment(HashMap<String, Object> map);
	// 댓글 목록
	List<Board> selectCommentList(HashMap<String, Object> map);
}
