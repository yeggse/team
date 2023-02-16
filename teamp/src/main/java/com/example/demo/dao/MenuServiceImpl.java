package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MenuMapper;



@Service //서비스임을 선언
public class MenuServiceImpl implements MenuService{

	@Autowired //Mapper와 연결
	private MenuMapper menuMapper;

	// 메뉴 추가
	@Override
	public void addMenu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("resnum")+" svim;");
		menuMapper.addMenu(map);	//추가만 존재함으로 return이 필요 없다!
	}
	
	//메뉴 이미지 추가
	@Override
	public void insertMenuImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		menuMapper.insertMenuImg(map);
	}

		
}