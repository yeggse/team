package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ResmenuMapper;
import com.example.demo.model.Res;


@Service //서비스임을 선언
public class ResmenuServiceImpl implements ResmenuService{

	@Autowired //Mapper와 연결
	private ResmenuMapper resmenuMapper;
	// 인터페이스 구체화
		@Override
		public List<Res> selectResmenu(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			
			return resmenuMapper.selectResmenu(map); // db를 호출하는 mapper와 연결
		}
		@Override
		public List<Res> selectResmenu1(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return resmenuMapper.selectResmenu1(map);
		}
}