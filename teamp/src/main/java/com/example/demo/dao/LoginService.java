package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Login;


public interface LoginService {
	List<Login> selectLoginList(HashMap<String, Object> map) throws Exception; 
}
