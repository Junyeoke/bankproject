package com.tenco.bank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.wls.shaded.org.apache.bcel.generic.RETURN;

/**
* @packageName     : com.tenco.bank.controller
* @fileName        : NoticeController.java
* @author          : GGG
* @date            : 2024.02.08
* @description     :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2024.02.08            GGG       최초 생성
*/

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@GetMapping("/list")
	public String NoticeListPage() {
		
		return "/board/notice";
	}
	


}
