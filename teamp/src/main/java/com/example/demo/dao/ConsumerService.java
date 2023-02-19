
  package com.example.demo.dao;
  
  import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Consumer;
  
  
  public interface ConsumerService { 
	  // 예약 내역 출력 
	  List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception;
	//리뷰 이미지 추가
	  void insertReviewImg(HashMap<String, Object> map);
	// 리뷰글 추가
	  void addReview(HashMap<String, Object> map);
}
 