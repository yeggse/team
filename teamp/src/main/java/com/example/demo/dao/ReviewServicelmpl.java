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

	@Override
	public List<Review> selectreviewList1(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.selectreviewList1(map);
	}

}