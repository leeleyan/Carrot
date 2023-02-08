package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.MainService;


@Controller 
public class MainController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MainService mainService; 

	 @RequestMapping("/main.do") // 메인 화면
     public String join(Model model) throws Exception{

		 return "/main"; // WEB-INF에서 호출할 파일명
    } 
	 
}