package com.example.demo.dao;

import java.util.List;

import jakarta.persistence.criteria.Join;


public interface JoinService {
	List<Join> selectJoinList() throws Exception; // 데이터 호출을 위한 인터페이스
}
