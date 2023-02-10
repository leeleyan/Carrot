package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.MainService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private MainService mainService;


	@Autowired
	HttpSession session;

	@RequestMapping("/main.do") // 메인 화면
	public String join(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/main"; // WEB-INF에서 호출할 파일명
	}

}