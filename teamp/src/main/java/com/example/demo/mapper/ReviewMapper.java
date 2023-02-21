package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Review;

@Mapper
public interface ReviewMapper {
	
	List<Review> selectreviewList(HashMap<String, Object> map) throws Exception;
	
	// 관리자 리뷰 리스트
	List<Review> adminReviewList(HashMap<String, Object> map) throws Exception;
	// 관리자 리뷰 갯수
	int countAdminRCnt(HashMap<String, Object> map);
	// 관리자 리뷰 상세 출력
	Review ARevDetail(HashMap<String, Object> map);
	//관리자 리뷰 삭제
	void deleteARev(HashMap<String, Object> map); 
	
	List<Review> selectreviewList2(HashMap<String, Object> map) throws Exception;
	void reviewFin(HashMap<String, Object> map);
	//리뷰상세출력
	Review detailReviewboard(HashMap<String, Object> map);
}
