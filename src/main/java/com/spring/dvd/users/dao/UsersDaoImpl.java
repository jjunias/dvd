package com.spring.dvd.users.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dvd.users.dto.UsersDto;


public class UsersDaoImpl implements UsersDao{

	@Override
	public int insert(UsersDto dto) {
		return 0;
	}

	@Override
	public List<UsersDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsersDto getData(String id) {
		// TODO Auto-generated method stub
		UsersDto dto = new UsersDto();
		dto.setUserName("hi");
		dto.setUserId("hello");
		return dto;
	}

	@Override
	public int update(UsersDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
