package com.example.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AdminMapper;


@Service //서비스임을 선언
public class AdminServiceImpl implements AdminService{

	@Autowired //Mapper와 연결
	private AdminMapper adminMapper;




		
}