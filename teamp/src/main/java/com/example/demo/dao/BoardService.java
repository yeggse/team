package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Board;


public interface BoardService {
	// 게시글 기본 출력
	List<Board> firstBoard(HashMap<String, Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
	
	
	List<Board> selectBoardList2(HashMap<String, Object> map) throws Exception;
}
