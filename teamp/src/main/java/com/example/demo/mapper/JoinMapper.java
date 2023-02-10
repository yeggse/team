package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {
	int insertMember(HashMap<String, Object> map);                                                 
}

