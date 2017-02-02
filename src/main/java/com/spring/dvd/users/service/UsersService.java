package com.spring.dvd.users.service;

import com.spring.dvd.generic.service.GenericService;
import com.spring.dvd.users.dao.UsersDao;
import com.spring.dvd.users.dto.UsersDto;

public interface UsersService extends GenericService<UsersDto, String, UsersDao> {

}
