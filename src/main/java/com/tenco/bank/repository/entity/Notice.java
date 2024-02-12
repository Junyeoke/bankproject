package com.tenco.bank.repository.entity;

import java.security.Timestamp;

import lombok.Data;

/**
* @packageName     : com.tenco.bank.repository.entity
* @fileName        : Notice.java
* @author          : GGG
* @date            : 2024.02.08
* @description     :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2024.02.08            GGG       최초 생성
*/

@Data
public class Notice {
	
	private Integer id;
	private String category;
	private String title;
	private String content;
	private String views;
	private Timestamp createdTime;
	
	private String uuidFilename;
	private String originFilename;
	
	// 이미지
	public String setUpImage() {
		return "/images/uploads" + uuidFilename;
	}

}
