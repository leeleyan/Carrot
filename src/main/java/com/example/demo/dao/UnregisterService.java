package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Unregister;


public interface UnregisterService {
	List<Unregister> selectUnregisterList() throws Exception; // 데이터 호출을 위한 인터페이스
}
