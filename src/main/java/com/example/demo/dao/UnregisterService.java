package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Unregister;


public interface UnregisterService {
	// 삭제
	int deleteUser(HashMap<String, Object> map);
	int getPasswordCheck(HashMap<String, Object> map); // 비번 중복체크
}
