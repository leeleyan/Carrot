package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.PwFindMapper;
import com.example.demo.model.PwFind;


@Service //서비스임을 선언
public class PwFindServiceImpl implements PwFindService{

	@Autowired //Mapper와 연결
	private PwFindMapper pwfindMapper;

	// 인터페이스 구체화
	@Override
	public List<PwFind> selectPwFindList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return pwfindMapper.selectPwFindList(map); // db를 호출하는 mapper와 연결
	}
}