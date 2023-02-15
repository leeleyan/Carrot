package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MessageService;
import com.example.demo.model.Message;
import com.google.gson.Gson;


@Controller 
public class MessageController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MessageService messageService; 

	 @RequestMapping("/message.do") // 쪽지 화면
     public String join(Model model) throws Exception{

		 return "/message"; // WEB-INF에서 호출할 파일명
    } 
	
	@RequestMapping(value = "/message/getmessage.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String message(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Message> list = messageService.selectMessageList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}