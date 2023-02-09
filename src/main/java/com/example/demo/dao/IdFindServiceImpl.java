package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.IdFindMapper;
import com.example.demo.model.IdFind;


@Service //서비스임을 선언
public class IdFindServiceImpl implements IdFindService{

	@Autowired //Mapper와 연결
	private IdFindMapper idfindMapper;

	// 인터페이스 구체화
	@Override
	public List<IdFind> selectIdFindList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return idfindMapper.selectIdFindList(map); // db를 호출하는 mapper와 연결
	}
}