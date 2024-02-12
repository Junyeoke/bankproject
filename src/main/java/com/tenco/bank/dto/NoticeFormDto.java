package com.tenco.bank.dto;


import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;

import org.springframework.web.multipart.MultipartFile;

import com.tenco.bank.utils.TimeUtils;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
* @packageName     : com.tenco.bank.dto
* @fileName        : NoticeFormDto.java
* @author          : GGG
* @date            : 2024.02.08
* @description     :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2024.02.08            GGG       최초 생성
*/

@Data
public class NoticeFormDto {
	
	private Integer id;
	private Integer noticeId;
	private String category;
	
	@NotEmpty
	@Size(max = 50)
	private String title;
	
	@NotEmpty
	private String content;
	private Integer views;
	private Timestamp createdTime;
	private MultipartFile file;
	private String originFilename;
	private String uuidFilename;
	
	
	// 공지사항 시간 처리하기
	public String timeFormat() {
		TimeUtils timeUtils = new TimeUtils();
		return timeUtils.dateTimeToString(createdTime);
	}

}
