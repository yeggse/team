package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.model.Admin;


@Service //서비스임을 선언
public class AdminServiceImpl implements AdminService{

	@Autowired //Mapper와 연결
	private AdminMapper adminMapper;
	
	// 관리자 일반회원 출력
	@Override
	public List<Admin> normalMemList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		return adminMapper.normalMemList(map);
	}
	
	// 관리자 사업자 회원 출력
	@Override
	public List<Admin> BuMemList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		return adminMapper.normalMemList(map);
	}




		
}