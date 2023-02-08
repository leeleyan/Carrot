package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ProInformationMapper;
import com.example.demo.model.ProInformation;


@Service //서비스임을 선언
public class ProInformationServiceImpl implements ProInformationService{

	@Autowired //Mapper와 연결
	private ProInformationMapper proinformationMapper;

	// 인터페이스 구체화
	@Override
	public List<ProInformation> selectProInformaitionList() throws Exception {
		// TODO Auto-generated method stub
		return proinformationMapper.selectProInformationList(); // db를 호출하는 mapper와 연결
	}
}