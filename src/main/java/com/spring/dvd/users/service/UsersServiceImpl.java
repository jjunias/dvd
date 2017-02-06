package com.spring.dvd.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.users.dao.UsersDao;
import com.spring.dvd.users.dto.UsersDto;

@Service
public class UsersServiceImpl extends GenericServiceImpl<UsersDto, String, UsersDao> implements UsersService {

	private PasswordEncoder pEncoder = new BCryptPasswordEncoder();

	@Autowired
	private UsersDao usersDao;

	@Override

	public int insert(UsersDto dto) {
		// String pwd = pEncoder.encode(dto.getId());
		// dto.setPwd(pwd);
		return usersDao.insert(dto);

	}

	@Override
	public boolean canUseId(String id) {
		return usersDao.canUseId(id);
	}

	@Override
	public boolean isValid(UsersDto dto) {
		String pwd = usersDao.isValid(dto.getId());
		// boolean test = pEncoder.matches(dto.getPwd(),pwd);
		if (pwd.equals(dto.getPwd())) {
			return true;
		} else {
			return false;

		}
	}

}
