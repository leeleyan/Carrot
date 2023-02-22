package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MyInformationMapper;
import com.example.demo.model.Member;


@Service 
public class MyInformationServiceImpl implements MyInformationService{

	@Autowired 
	private MyInformationMapper myinformationMapper;


	@Override
	public Member getInfo(HashMap<String, Object> map) throws Exception {
		return myinformationMapper.getInfo(map);
	}


	@Override
	public void updateTel(HashMap<String, Object> map) {
		myinformationMapper.updateTel(map);
	}


	@Override
	public void editNickName(HashMap<String, Object> map) {
		myinformationMapper.editNickName(map);
	}


	@Override
	public void editEmail(HashMap<String, Object> map) {
		myinformationMapper.editEmail(map);
	}
	
	@Override
	public HashMap<String, Object> updateNick(HashMap<String, Object> map) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int a = myinformationMapper.updateNick(map);
		int b = myinformationMapper.updateNick2(map);
		int c = myinformationMapper.updateNick3(map);
		result.put("num", a);
		result.put("num2", b);
		result.put("num3", c);
		return result;
	}
}