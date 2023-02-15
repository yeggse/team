package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.MemberMapper;
import com.example.test1.model.Member;


@Service //서비스임을 선언
public class MemberServiceImpl implements MemberService{

	@Autowired //Mapper와 연결
	private MemberMapper memberMapper;

	// 인터페이스 구체화
	@Override
	public Member getMember(HashMap<String, Object> map){
		// TODO Auto-generated method stub
		
		return memberMapper.selectMember(map); // db를 호출하는 mapper와 연결
	}
	
}