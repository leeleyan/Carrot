package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Member;


public interface UnregisterService {
	Member getInfo(HashMap<String,Object> map) throws Exception;
	HashMap<String, Object> deleteUser(HashMap<String, Object> map);
	int getPasswordCheck(HashMap<String, Object> map); // 비번 중복체크
}
