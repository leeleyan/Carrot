package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Member;


public interface LoginService {
	Member getMember(HashMap<String, Object> map);
}
