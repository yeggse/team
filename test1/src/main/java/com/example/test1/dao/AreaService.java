package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Area;

public interface AreaService {
	List<Area> selectSiList(HashMap<String, Object> map) throws Exception;
	List<Area> selectGuList(HashMap<String, Object> map) throws Exception;
	List<Area> selectDongList(HashMap<String, Object> map) throws Exception;
}
