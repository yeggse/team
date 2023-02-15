package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BMapper;
import com.example.demo.model.B;


@Service //서비스임을 선언
public class BServiceImpl implements BService{

	@Autowired //Mapper와 연결
	private BMapper bMapper;

		// 메뉴 추가
		@Override
		public void addMenu(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			System.out.println(map.get("resnum")+" svim;");
			bMapper.addMenu(map);	//추가만 존재함으로 return이 필요 없다!
		}

		
}