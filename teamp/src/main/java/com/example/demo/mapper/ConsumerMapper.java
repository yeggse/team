
  package com.example.demo.mapper;
  
  import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Consumer;
  
  
  @Mapper public interface ConsumerMapper { 
	  // 예약 내역 출력 
	  List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception;
	//리뷰 이미지 추가
	  void insertReviewImg(HashMap<String, Object> map);
	// 리뷰글 추가
	  void addReview(HashMap<String, Object> map);
	  
}
