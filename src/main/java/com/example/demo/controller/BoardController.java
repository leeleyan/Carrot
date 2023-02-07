package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.BoardService;
import com.example.demo.model.Board;
import com.google.gson.Gson;


@Controller // 컨트롤러라고 선언함
public class BoardController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private BoardService boardService; 

    
	 @RequestMapping("/login.do") 
     public String login(Model model) throws Exception{

		 return "/login"; // WEB-INF에서 호출할 파일명
    }
	
	 @RequestMapping("/join.do") 
     public String join(Model model) throws Exception{

		 return "/join"; // WEB-INF에서 호출할 파일명
    } 
	 
}