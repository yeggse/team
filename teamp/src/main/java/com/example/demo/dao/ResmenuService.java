package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Res;


public interface ResmenuService {
	List<Res> selectResmenu(HashMap<String, Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
	List<Res> selectResmenu1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Res> selectPaymentmy1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	
	//	사업자 메뉴관리 페이지에 사용 
	List<Res> selectResmenu2(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Res> searchMenuname(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	int selectResmenuCnt();
	List<Res> businessReserveList(HashMap<String, Object> map) throws Exception;
	
	HashMap<String, Object> selectStorecliectedImg(HashMap<String, Object> map);
	int insertreserve(HashMap<String, Object> map) throws Exception;
}
