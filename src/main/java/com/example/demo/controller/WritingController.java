package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AreaService;
import com.example.demo.dao.MessageService;
import com.example.demo.dao.WritingService;
import com.google.gson.Gson;


@Controller 
public class WritingController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private WritingService writingService; 
    
    @Autowired
    private MessageService messageService;
    
	 @RequestMapping("/writing.do") // 쪽지 쓰기 팝업 화면
     public String join(Model model) throws Exception{

		 return "/writing"; // WEB-INF에서 호출할 파일명
    } 
		@RequestMapping(value = "/writing/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String Insertmessage(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int num = writingService.addMessage(map);
			if (num > 0)
				resultMap.put("result", "success");
			else
				resultMap.put("result", "fail");
			return new Gson().toJson(resultMap);
		}
}