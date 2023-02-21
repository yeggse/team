package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ReviewMapper;
import com.example.demo.model.Review;


@Service //서비스임을 선언
public class ReviewServicelmpl implements ReviewService{

	@Autowired //Mapper와 연결
	private ReviewMapper reviewMapper;
	
	@Override
	public List<Review> selectreviewList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.selectreviewList(map);
	}
	
	//관리자 리뷰리스트
	@Override
	public List<Review> adminReviewList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.adminReviewList(map);
	}
	// 관리자 리뷰 갯수
	@Override
	public int countAdminRCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return reviewMapper.countAdminRCnt(map);
	}
	// 관리자 리뷰 상세 출력
	@Override
	public HashMap<String, Object> ARevDetail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Review review = reviewMapper.ARevDetail(map);
		resultMap.put("board", review);
		return resultMap;
	}
	//관리자 리뷰 삭제
	@Override
	public void deleteARev(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.deleteARev(map);
	}
	
	
	
	
	@Override
	public List<Review> selectreviewList2(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.selectreviewList2(map);
	}

	@Override
	public void reviewFin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewMapper.reviewFin(map);
	}
	@Override
	public HashMap<String, Object> detailReviewboard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Review review = reviewMapper.detailReviewboard(map);
		resultMap.put("review", review);
		return resultMap;
	}







}