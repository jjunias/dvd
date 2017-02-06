package com.spring.dvd.users.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.users.dao.UsersDao;
import com.spring.dvd.users.dto.UsersDto;

@Service
public class UsersServiceImpl extends GenericServiceImpl<UsersDto, String, UsersDao> implements UsersService {

	@Autowired
	private UsersDao usersDao;
	
	@Override
	public boolean canUseId(String id) {

		return usersDao.canUseId(id);
	}

}
