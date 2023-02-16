package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.PasswordChangeMapper;
import com.example.demo.model.Member;


@Service 
public class PasswordChangeServiceImpl implements PasswordChangeService{

	@Autowired 
	private PasswordChangeMapper passwordchangeMapper;
	
	@Override
	public Member getInfo(HashMap<String, Object> map) throws Exception {
		return passwordchangeMapper.getInfo(map);
	}
	
	@Override
	public void updatePassword(HashMap<String, Object> map) {
		passwordchangeMapper.updatePassword(map);
	}

}