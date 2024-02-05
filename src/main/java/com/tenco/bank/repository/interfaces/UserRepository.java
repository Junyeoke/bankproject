package com.tenco.bank.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.bank.dto.SignUpFormDto;
import com.tenco.bank.repository.entity.User;

// interface + xml 연결 : @Mapper 사용
@Mapper // 반드시 선언
public interface UserRepository {
	
	public int insert(User user);
	public int updateById(User user);
	public int deleteById(Integer id);
	public User findById(Integer id);
	public List<User> findAll();
	
	
	// 사용자 username으로 존재여부 확인
	public User findByUsername(String username);
	public User findByUsernameAndPassword(User user);
	
	
	// DB에 등록된 이메일 존재하는지 확인
	public String findByMail(@RequestParam String email);
	
	
	// 회원 비밀번호를 임시 비밀번호로 변경
		public void tempPasswordUpdate(@RequestParam String password, @RequestParam String userEmail);
		
		
		// 전화번호로 이메일 조회
		public String findByNameToEmail(@RequestParam String username);


}
