package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UnregisterMapper;


@Service //서비스임을 선언
public class UnregisterServiceImpl implements UnregisterService{
	@Autowired
	private UnregisterMapper unregisterMapper;

	// 인터페이스 구체화
	@Override
	public int deleteUser(HashMap<String, Object> map) {
		return unregisterMapper.deleteUser(map);
	}
	
	@Override
	public int getPasswordCheck(HashMap<String, Object> map) {
		return unregisterMapper.selectPasswordCheck(map);
	}
}