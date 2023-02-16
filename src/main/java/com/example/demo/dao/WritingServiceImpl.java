package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.WritingMapper;
import com.example.demo.model.Member;


@Service //서비스임을 선언
public class WritingServiceImpl implements WritingService{

	@Autowired //Mapper와 연결
	private WritingMapper writingMapper;
	
	@Override
	public Member getInfo(HashMap<String, Object> map) throws Exception {
		return writingMapper.getInfo(map);
	}
	
	@Override
	public int addMessage(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return writingMapper.insertMessage(map);
	}
	
	@Override
	public int getMemberCheck(HashMap<String, Object> map) {
		return writingMapper.NicknameCheck(map);
	}
	
}