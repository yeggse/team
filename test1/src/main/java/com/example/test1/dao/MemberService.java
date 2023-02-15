package com.example.test1.dao;

import java.util.HashMap;

import com.example.test1.model.Member;


public interface MemberService {
	Member getMember(HashMap<String, Object> map); // 데이터 호출을 위한 인터페이스
}
