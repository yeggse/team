
  package com.example.demo.mapper;
  
  import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Consumer;
import com.example.demo.model.Res;
  
  
  @Mapper public interface ConsumerMapper { 
	  // 예약 내역 출력 
	  List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception;
	//리뷰 이미지 추가
	  void insertReviewImg(HashMap<String, Object> map);
	// 리뷰글 추가
	  void addReview(HashMap<String, Object> map);
		 //개인 결제내역
		List<Res> selectPaymentmy1(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
  
}
