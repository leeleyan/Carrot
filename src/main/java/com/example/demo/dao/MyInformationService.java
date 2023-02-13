package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Member;


public interface MyInformationService {
	Member getInfo(HashMap<String,Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
	void updateTel(HashMap<String, Object> map);
	void editNickName(HashMap<String, Object> map);
	void editEmail(HashMap<String, Object> map);
}
