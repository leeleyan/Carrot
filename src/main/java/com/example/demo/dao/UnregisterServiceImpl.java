package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UnregisterMapper;
import com.example.demo.model.Member;


@Service //서비스임을 선언
public class UnregisterServiceImpl implements UnregisterService{
	@Autowired
	private UnregisterMapper unregisterMapper;
	
	@Override
	public Member getInfo(HashMap<String, Object> map) throws Exception {
		return unregisterMapper.getInfo(map);
	}
	
	// 인터페이스 구체화
	@Override
	public HashMap<String, Object> deleteUser(HashMap<String, Object> map) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int a = unregisterMapper.deleteUser(map);
		int b = unregisterMapper.deleteUser2(map);
		int c = unregisterMapper.deleteUser3(map);
		int d = unregisterMapper.deleteUser4(map);
		result.put("num", a);
		result.put("num2", b);
		result.put("num3", c);
		result.put("num4", d);
		return result;
	}
	
	@Override
	public int getPasswordCheck(HashMap<String, Object> map) {
		return unregisterMapper.selectPasswordCheck(map);
	}
}