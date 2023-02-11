package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.JoinMapper;
import com.example.demo.model.Join;



@Service //서비스임을 선언
public class JoinServiceImpl implements JoinService{

	@Autowired //Mapper와 연결
	private JoinMapper joinMapper;
	
	@Override
	public int getMemberList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return joinMapper.insertMember(map);
	}

	@Override
	public int getCheck(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinMapper.selectCheck(map);
	}

	@Override
	public List<Join> searchpw(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinMapper.searchpw(map);
	}

}
