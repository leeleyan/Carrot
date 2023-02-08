package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Login;


public interface LoginService {
	List<Login> selectLoginList() throws Exception; // 데이터 호출을 위한 인터페이스
}
