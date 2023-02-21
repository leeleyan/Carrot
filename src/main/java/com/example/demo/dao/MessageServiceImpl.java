package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MessageMapper;
import com.example.demo.model.Message;


@Service //서비스임을 선언
public class MessageServiceImpl implements MessageService{

	@Autowired //Mapper와 연결
	private MessageMapper messageMapper;

	// 인터페이스 구체화
	@Override
	public List<Message> selectMessageList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return messageMapper.selectMessageList(map); // db를 호출하는 mapper와 연결
	}

	@Override
	public List<Message> selectSendList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return messageMapper.selectSendList(map);
	}

	@Override
	public List<Message> selectGotMessageList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return messageMapper.selectGotMessageList(map);
	}

	@Override
	public void deleteMessage(HashMap<String, Object> map) {
		messageMapper.deleteMessage(map);
	}
}