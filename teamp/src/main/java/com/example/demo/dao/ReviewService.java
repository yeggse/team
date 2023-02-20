package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Review;


public interface ReviewService {
	List<Review> selectreviewList(HashMap<String, Object> map) throws Exception;
	List<Review> selectreviewList1(HashMap<String, Object> map) throws Exception;
	List<Review> selectreviewList2(HashMap<String, Object> map) throws Exception;
}
