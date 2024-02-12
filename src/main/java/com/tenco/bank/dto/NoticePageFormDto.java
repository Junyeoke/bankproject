package com.tenco.bank.dto;

import lombok.Data;

/**
* @packageName     : com.tenco.bank.dto
* @fileName        : NoticePageFormDto.java
* @author          : GGG
* @date            : 2024.02.08
* @description     :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2024.02.08            GGG       최초 생성
*/

@Data
public class NoticePageFormDto {
	
	// 페이징 처리하기
	private Integer page;
	private String keyword;
	private String type;

}
