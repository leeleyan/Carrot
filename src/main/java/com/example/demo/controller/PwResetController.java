package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.PwResetService;


@Controller 
public class PwResetController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private PwResetService pwresetService; 

	 @RequestMapping("/pwreset.do") // 비밀번호 초기화 팝업 화면
     public String join(Model model) throws Exception{

		 return "/pwreset"; // WEB-INF에서 호출할 파일명
    } 
	 
}