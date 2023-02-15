package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Res;


@Mapper
public interface ResmenuMapper {
	List<Res> selectResmenu(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Res> selectResmenu1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Res> selectPaymentmy1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음

	//	사업자 메뉴관리 페이지에 사용 
	List<Res> selectResmenu2(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
}
