package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Review;


public interface ReviewService {
	List<Review> selectreviewList(HashMap<String, Object> map) throws Exception;
	//관리자 리뷰리스트
	List<Review> adminReviewList(HashMap<String, Object> map) throws Exception;
	//관리자 리뷰 갯수
	int countAdminRCnt(HashMap<String, Object> map);
	
	List<Review> selectreviewList2(HashMap<String, Object> map) throws Exception;
	void reviewFin(HashMap<String, Object> map);
	
	//게시글 상세출력
		HashMap<String, Object> detailReviewboard(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
}
