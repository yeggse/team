package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Review;

@Mapper
public interface ReviewMapper {
	
	List<Review> selectreviewList(HashMap<String, Object> map) throws Exception;
	List<Review> selectreviewList1(HashMap<String, Object> map) throws Exception;
}
