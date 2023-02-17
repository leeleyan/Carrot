package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Member;


public interface AddService {
	Member getInfo(HashMap<String,Object> map) throws Exception;
	void insertBoardImg(HashMap<String, Object> map);
	void insertBoard(HashMap<String, Object> map);
	
}
