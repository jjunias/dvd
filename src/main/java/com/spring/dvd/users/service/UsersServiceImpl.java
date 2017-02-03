package com.spring.dvd.users.service;

import org.springframework.stereotype.Service;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.users.dao.UsersDao;
import com.spring.dvd.users.dto.UsersDto;

@Service
public class UsersServiceImpl extends GenericServiceImpl<UsersDto, String, UsersDao> implements UsersService {

}
