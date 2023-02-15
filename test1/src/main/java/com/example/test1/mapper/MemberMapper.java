package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Member;


@Mapper
public interface MemberMapper {
	Member selectMember(HashMap<String, Object> map); // xml파일 접근 및 db 호출결과 리턴 받음
}
