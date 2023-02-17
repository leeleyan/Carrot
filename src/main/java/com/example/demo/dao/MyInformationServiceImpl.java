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
	public void updateNick(HashMap<String, Object> map) {
		myinformationMapper.updateNick(map);
	}
}