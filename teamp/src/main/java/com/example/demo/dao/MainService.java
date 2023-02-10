package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Main;


public interface MainService {
	List<Main> searchStoreList(HashMap<String, Object> map) throws Exception; 
		// TODO Auto-generated method stub
	// 스토어 리스트 : 음식점 출력을 위해 필요
	HashMap<String, Object> getStoreList(HashMap<String, Object> map);
	
	// 데이터 호출을 위한 인터페이스
	List<Main> selectMainList2(HashMap<String, Object> map) throws Exception;
	
	
	// @@목록 조회
	List<Main> getList(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
	
}
