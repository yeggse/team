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
	List<Res> searchMenuname(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	List<Res> businessReserveList(HashMap<String, Object> map) throws Exception;
	List<Res> businessReserveList1(HashMap<String, Object> map) throws Exception;
	
	//사업자 메뉴관리 페이지 게시물 갯수
	int selectResmenuCnt(HashMap<String, Object> map);
	
	Res selectStorecliectedImg(HashMap<String, Object> map);
	int insertreserve(HashMap<String, Object> map) throws Exception;
	
	// 사업자 판매완료 버튼 이벤트
	void saleFin(HashMap<String, Object> map);	//update
	//재고수정
	void editSupply(HashMap<String, Object> map);
	////삭제
	void deleteresmenu(HashMap<String, Object>map);
	//일시품절 버튼
	void soldout(HashMap<String, Object> map);	
	//다시판매 버튼
	void resell(HashMap<String, Object> map);	
}
