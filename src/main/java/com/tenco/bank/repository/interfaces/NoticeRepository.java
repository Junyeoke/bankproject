package com.tenco.bank.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.bank.dto.NoticeFormDto;
import com.tenco.bank.dto.NoticePageFormDto;
import com.tenco.bank.repository.entity.Notice;

/**
* @packageName     : com.tenco.bank.repository.interfaces
* @fileName        : NoticeRepository.java
* @author          : GGG
* @date            : 2024.02.08
* @description     :
* ===========================================================
* DATE              AUTHOR             NOTE
* -----------------------------------------------------------
* 2024.02.08            GGG       최초 생성
*/


@Mapper
public interface NoticeRepository {
	
	// insert
	public int insert(NoticeFormDto noticeFormDto);
	
	// select
	public List<Notice> selectByNoticeDto(NoticePageFormDto noticePageFormDto);
	
	// select
	public Notice selectById(Integer id);
	
	// update
	public int updateByNoticeDto(NoticeFormDto noticeFormDto);
	
	// delete
	public int deleteById(Integer id);
	
	// 파일처리
	public int insertFile(NoticeFormDto noticeFormDto);
	public int selectLimit(NoticeFormDto noticeFormDto);
	
	// 페이징처리
	public List<Notice> selectByNoticeDtoOrderBy();
	public Integer selectNoticeCount(NoticePageFormDto noticePageFormDto);
	
	// 검색하기
	public List<Notice> selectNoticeByKeyword(NoticePageFormDto noticePageFormDto);
	public List<Notice> selectNoticeByTitle(NoticePageFormDto noticePageFormDto);
	public Integer selectNoticeCountByTitle(NoticePageFormDto noticePageFormDto);
	public Integer selectNoticeCountByKeyword(NoticePageFormDto noticePageFormDto);

}
