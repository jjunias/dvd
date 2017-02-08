package com.spring.dvd.users.dao;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.users.dto.UsersDto;


public interface UsersDao extends GenericDao<UsersDto, String> {

	public boolean canUseId(String id);
	public String isValid(String id);
	public String getPassword(String id);
	public int pwdUpdate(UsersDto dto);
} 	
