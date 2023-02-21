package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Review;


public interface ReviewService {
	List<Review> selectreviewList(HashMap<String, Object> map) throws Exception;
	List<Review> selectreviewList1(HashMap<String, Object> map) throws Exception;
	List<Review> selectreviewList2(HashMap<String, Object> map) throws Exception;
	void reviewFin(HashMap<String, Object> map);
	
	//게시글 상세출력
		HashMap<String, Object> detailReviewboard(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
}
