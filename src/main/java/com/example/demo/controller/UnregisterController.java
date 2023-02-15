package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.MyInformationService;
import com.example.demo.dao.UnregisterService;
import com.example.demo.model.Member;
import com.example.demo.model.Unregister;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.persistence.criteria.Join;



@Controller 
public class UnregisterController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private UnregisterService unregisterService; 
    private MyInformationService myInformationService;
    
	 @RequestMapping("/unregister.do") // 회원탈퇴 팝업 화면
     public String join(Model model) throws Exception{

		 return "/unregister"; // WEB-INF에서 호출할 파일명
    } 
	
	 @RequestMapping(value = "/join/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String remove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		 HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = unregisterService.deleteUser(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
		}
	 
	// 비밀번호 중복 체크
		 @RequestMapping(value = "/join/passwordcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		 	@ResponseBody
		 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		 		int num = unregisterService.getPasswordCheck(map);
		 		resultMap.put("num", num);
		 		return new Gson().toJson(resultMap);
		 	}
		 
}