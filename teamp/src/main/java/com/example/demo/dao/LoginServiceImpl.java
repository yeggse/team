package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.LoginMapper;
import com.example.demo.model.Login;

@Service //서비스임을 선언
public class LoginServiceImpl implements LoginService{

	@Autowired //Mapper와 연결
	private LoginMapper loginMapper;

	@Override
	public Login selectLoginList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectLoginList(map);
	}
	@Override
	public List<Login> searchid(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.searchid(map);
	}
}

