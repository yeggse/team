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
	// 관리자 리뷰 상세 출력
	HashMap<String, Object> ARevDetail(HashMap<String, Object> map);
	//관리자 리뷰 삭제
	void deleteARev(HashMap<String, Object> map); 
	
	//사업자 리뷰리스트
	List<Review> BuReviewList(HashMap<String, Object> map) throws Exception;
	// 사업자 리뷰리스트 갯수
	int BuReviewCnt(HashMap<String, Object> map);
	
	
	void reviewFin(HashMap<String, Object> map);
	
	//게시글 상세출력
		HashMap<String, Object> detailReviewboard(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
	// 댓글 입력
		void insertComment(HashMap<String, Object> map);	
}
