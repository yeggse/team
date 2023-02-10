package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Main;


@Mapper
public interface MainMapper {
	List<Main> searchStoreList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Main> selectMainList2(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	Main selectstore(HashMap<String, Object> map);
	
	//@@@
	List<Main> searchList(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음

}
