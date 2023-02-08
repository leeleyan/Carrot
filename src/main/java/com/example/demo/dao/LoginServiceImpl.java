package com.example.demo.dao;

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
	public List<Login> selectLoginList() throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectLoginList(); // db를 호출하는 mapper와 연결
	}
}