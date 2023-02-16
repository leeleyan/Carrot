package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Member;

public interface WritingService {
	Member getInfo(HashMap<String,Object> map) throws Exception;
	int addMessage(HashMap<String, Object> map) throws Exception;
	int getMemberCheck(HashMap<String, Object> map);
}
