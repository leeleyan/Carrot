package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AddMapper;
import com.example.demo.model.Member;


@Service //서비스임을 선언
public class AddServiceImpl implements AddService{

	@Autowired //Mapper와 연결
	private AddMapper addMapper;

	@Override
	public Member getInfo(HashMap<String, Object> map) throws Exception {
		return addMapper.getInfo(map);
	}
	
	@Override
	public void insertBoardImg(HashMap<String, Object> map) {
		addMapper.insertBoardImg(map);
	}
	
	@Override
	public void insertBoard(HashMap<String, Object> map) {
		addMapper.insertBoard(map);
	}
}