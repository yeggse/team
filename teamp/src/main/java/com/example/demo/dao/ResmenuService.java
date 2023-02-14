package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Res;


public interface ResmenuService {
	List<Res> selectResmenu(HashMap<String, Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
	Res selectResmenu1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
}
