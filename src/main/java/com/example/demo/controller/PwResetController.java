package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.PwResetService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller 
public class PwResetController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private PwResetService pwresetService; 
    
    @Autowired
    HttpSession session;

	 @RequestMapping("/pwreset.do") // 비밀번호 초기화 팝업 화면
     public String join(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		 String id = (String)session.getAttribute("userIdSession");
		 request.setAttribute("userId", id);
		 return "/pwreset"; // WEB-INF에서 호출할 파일명
    } 
	
	 @RequestMapping(value = "/pwreset/pwdupdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String pwupdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = pwresetService.pwdUpdate(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
}