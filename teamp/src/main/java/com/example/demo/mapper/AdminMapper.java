package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Admin;

@Mapper
public interface AdminMapper {
	// 관리자 일반회원 출력
	List<Admin> normalMemList(HashMap<String, Object> map) throws Exception;	
}
