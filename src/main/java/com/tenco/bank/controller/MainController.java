package com.tenco.bank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	
	// 홈화면
	@GetMapping("/home")
	public String mainPage() {
		
		return "/layout/main";
	}
	
	// QNA
	@GetMapping("/qna")
	public String qnaPage() {
		
		return "/board/qna";
	}

}
