package com.tenco.bank.repository.interfaces;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

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

}
