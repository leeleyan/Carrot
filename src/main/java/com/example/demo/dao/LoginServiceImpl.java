package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.LoginMapper;
import com.example.demo.model.Login;


@Service //서비스임을 선언
public class LoginServiceImpl implements LoginService{

	@Autowired //Mapper와 연결
	private LoginMapper loginMapper;

	// 인터페이스 구체화
	@Override
	public List<Login> selectLoginList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectLoginList(map); // db를 호출하는 mapper와 연결
	}
	
	@Override
	public Login getMember(HashMap<String, Object> map){
		// TODO Auto-generated method stub
		
		return loginMapper.selectMember(map); // db를 호출하는 mapper와 연결
	}
}