package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MyInformationMapper;
import com.example.demo.model.Member;


@Service //서비스임을 선언
public class MyInformationServiceImpl implements MyInformationService{

	@Autowired //Mapper와 연결
	private MyInformationMapper myinformationMapper;


	@Override
	public Member getInfo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myinformationMapper.getInfo(map);
	}
}