package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.PwResetMapper;
import com.example.demo.model.PwReset;


@Service //서비스임을 선언
public class PwResetServiceImpl implements PwResetService{

	@Autowired //Mapper와 연결
	private PwResetMapper pwresetMapper;

	// 인터페이스 구체화
	@Override
	public List<PwReset> selectPwResetList() throws Exception {
		// TODO Auto-generated method stub
		return pwresetMapper.selectPwResetList(); // db를 호출하는 mapper와 연결
	}
	
	@Override
	public int pwdUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return pwresetMapper.pwdUpdate(map);
	}
}