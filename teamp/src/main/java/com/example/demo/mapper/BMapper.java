package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.B;


@Mapper
public interface BMapper {
	// 게시글 기본출력
//	List<Board> firstBoardList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
//	
//	// 게시글 상세 출력
//	Board detailBoard(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
//	
//	// 게시글 수정
//	void editBoard(HashMap<String, Object> map);	//update
//	
	// 메뉴 추가
	void addMenu(HashMap<String, Object> map);	//insert
	
	// 게시글 삭제
//	void deleteBoard(HashMap<String, Object>map);	// delete
}
