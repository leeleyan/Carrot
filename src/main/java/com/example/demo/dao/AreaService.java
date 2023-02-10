package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Area;

public interface AreaService {
	List<Area> selectSiList(HashMap<String, Object> map) throws Exception;
	List<Area> selectGuList(HashMap<String, Object> map) throws Exception;
	List<Area> selectDongList(HashMap<String, Object> map) throws Exception;
}
