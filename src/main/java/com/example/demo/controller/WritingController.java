package com.example.demo.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MessageService;
import com.example.demo.dao.WritingService;
import com.example.demo.model.Member;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller 
public class WritingController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private WritingService writingService; 
    
    @Autowired
    private MessageService messageService;
    
    @Autowired
	HttpSession session;
    
	 @RequestMapping("/writing.do") // 쪽지 쓰기 팝업 화면
     public String join(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		 request.setAttribute("map", map);
		 return "/writing"; // WEB-INF에서 호출할 파일명
    } 
	 
	 @RequestMapping("/send.do") // 받은 쪽지 팝업 화면
     public String send(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		 request.setAttribute("map", map);
		 System.out.println(map);
		 return "/messagesend"; // WEB-INF에서 호출할 파일명
    } 
	 
	 @RequestMapping("/got.do") // 보낸 쪽지 팝업 화면
     public String got(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		 request.setAttribute("map", map);
		 System.out.println(map);
		 return "/messagegot"; // WEB-INF에서 호출할 파일명
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
		
		@RequestMapping(value = "/writing/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		 @ResponseBody
		 public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		Member user = writingService.getInfo(map);
	 		resultMap.put("nickname", user.getuNickname());
	 		return new Gson().toJson(resultMap);
	 	}
		//닉네임 체크
		@RequestMapping(value = "/writing/nicknamecheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = writingService.getMemberCheck(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
}