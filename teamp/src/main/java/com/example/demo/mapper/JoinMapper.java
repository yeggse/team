package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;




@Mapper
public interface JoinMapper {
	int insertMember(HashMap<String, Object> map);                                                 // xml파일 접근 및 db 호출결과 리턴 받음
}

