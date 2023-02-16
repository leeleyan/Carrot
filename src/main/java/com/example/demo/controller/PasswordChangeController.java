package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.PasswordChangeService;
import com.example.demo.model.Member;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller 
public class PasswordChangeController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private PasswordChangeService passwordchangeService; 
    
	 @RequestMapping("/passwordchange.do") // 주소변경
     public String join(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		 return "/passwordchange"; // WEB-INF에서 호출할 파일명
    } 
	 
	 @RequestMapping(value = "/passwordchange/updatepassword.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String editTel(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			passwordchangeService.updatePassword(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
	 }
	
	 @RequestMapping(value = "/passwordchange/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 @ResponseBody
	 public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		Member user = passwordchangeService.getInfo(map);
 		resultMap.put("password", user.getuPassword());
 		return new Gson().toJson(resultMap);
 	}
	 
}