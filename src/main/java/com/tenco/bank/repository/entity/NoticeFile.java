package com.tenco.bank.repository.entity;

import lombok.Data;

/**
* @packageName     : com.tenco.bank.repository.entity
* @fileName        : NoticeFile.java
* @author          : GGG
* @date            : 2024.02.08
* @description     :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2024.02.08            GGG       최초 생성
*/

@Data
public class NoticeFile {
	
	private Integer noticeId;
	private String originFilename;
	private String uuidFilename;

}
