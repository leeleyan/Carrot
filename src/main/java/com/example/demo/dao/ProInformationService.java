package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.ProInformation;


public interface ProInformationService {
	List<ProInformation> selectProInformaitionList() throws Exception; // 데이터 호출을 위한 인터페이스
}
