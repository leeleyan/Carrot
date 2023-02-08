package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Main;


public interface MainService {
	List<Main> selectMainList() throws Exception; // 데이터 호출을 위한 인터페이스
}
