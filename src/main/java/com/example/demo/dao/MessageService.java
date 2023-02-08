package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Message;


public interface MessageService {
	List<Message> selectMessageList() throws Exception; // 데이터 호출을 위한 인터페이스
}
