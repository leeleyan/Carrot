package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Member;


public interface PasswordChangeService {
	Member getInfo(HashMap<String,Object> map) throws Exception;
	void updatePassword(HashMap<String, Object> map);
}
