package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.LoginMapper;
import com.example.demo.model.Member;


@Service //서비스임을 선언
public class LoginServiceImpl implements LoginService{

	@Autowired //Mapper와 연결
	private LoginMapper loginMapper;

	@Override
	public Member getMember(HashMap<String, Object> map){
		// TODO Auto-generated method stub
		
		return loginMapper.getMember(map); // db를 호출하는 mapper와 연결
	}
}