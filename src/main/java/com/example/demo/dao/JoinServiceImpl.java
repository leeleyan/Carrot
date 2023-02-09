package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.JoinMapper;

import jakarta.persistence.criteria.Join;


@Service //서비스임을 선언
public class JoinServiceImpl implements JoinService{

	@Autowired //Mapper와 연결
	private JoinMapper joinMapper;

	// 인터페이스 구체화
	@Override
	public List<Join> selectJoinList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinMapper.selectJoinList(map); // db를 호출하는 mapper와 연결
	}

	@Override
	public int addMember(HashMap<String, Object> map) {
		return joinMapper.insertMember(map);
	}
	
	@Override
	public int getMemberCheck(HashMap<String, Object> map) {
		return joinMapper.selectMemberCheck(map);
	}






}