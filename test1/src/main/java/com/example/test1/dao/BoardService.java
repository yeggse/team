package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {
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
	HashMap<String, Object> selectGetBoard(HashMap<String, Object> map);
	// 댓글 입력
	void insertComment(HashMap<String, Object> map);
	// 댓글 목록
	List<Board> selectCommentList(HashMap<String, Object> map) throws Exception;
}
