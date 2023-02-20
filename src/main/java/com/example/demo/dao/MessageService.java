package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Message;


public interface MessageService {
	List<Message> selectMessageList(HashMap<String, Object> map) throws Exception; // 데이터 호출을 위한 인터페이스
	List<Message> selectGotMessageList(HashMap<String, Object> map) throws Exception;
	List<Message> selectSendList(HashMap<String, Object> map) throws Exception;
}
