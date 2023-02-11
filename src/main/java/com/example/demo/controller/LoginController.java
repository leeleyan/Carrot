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

import com.example.demo.dao.LoginService;
import com.example.demo.model.Login;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;


@Controller 
public class LoginController {
	// Service 인터페이스 객체 생성 및 연결
	
	@Autowired
	HttpSession session;
	
    @Autowired
    private LoginService loginService; 

	 @RequestMapping("/login.do") // 로그인 화면
     public String join(Model model) throws Exception{

		 return "/login"; // WEB-INF에서 호출할 파일명
    } 

	 @RequestMapping(value = "/login/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		List<Login> list = loginService.selectLoginList(map);
	 		if(list.size() > 0) {
	 			resultMap.put("result", "success");
	 		} else {
	 			resultMap.put("result", "fail");
	 		}
	 		resultMap.put("list", list);
	 		return new Gson().toJson(resultMap);
	 	}
	 
}