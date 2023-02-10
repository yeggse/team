package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.JoinMapper;

@Service //서비스임을 선언
public class JoinServiceImpl implements JoinService{

	@Autowired //Mapper와 연결
	private JoinMapper joinMapper;
	
	@Override
	public int getMemberList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return joinMapper.insertMember(map);
	}

}
