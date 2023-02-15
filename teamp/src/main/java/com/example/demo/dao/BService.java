package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.B;


public interface BService {
//	// 게시글 기본 출력
//	List<Board> firstBoard(HashMap<String, Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
//	// 게시글 상세 출력
//	HashMap<String, Object> detailBoard(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스	
//	// 게시글 수정
//	void editBoard(HashMap<String, Object> map);	//update
	// 메뉴 추가
	void addMenu(HashMap<String, Object> map);	//add / insert
	// 게시글 삭제
//	void deleteBoard(HashMap<String, Object> map);
}
