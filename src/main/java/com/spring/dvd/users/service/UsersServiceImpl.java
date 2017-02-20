package com.spring.dvd.users.service;

import java.util.List;

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
		String pwd = dto.getPwd();
		String encoderPwd = pEncoder.encode(pwd);
		dto.setPwd(encoderPwd);
		return usersDao.insert(dto);
	}

	@Override
	public boolean canUseId(String id) {
		return usersDao.canUseId(id);
	}

	@Override
	public boolean isValid(UsersDto dto) {
		String Encoderpwd = usersDao.isValid(dto.getId());
		String pwd = dto.getPwd();
		return pEncoder.matches(pwd, Encoderpwd);
	}

	@Override
	public int update(UsersDto dto) {
		return usersDao.update(dto);
	}

	@Override
	public int delete(String data) {
		return usersDao.delete(data);
	}

	@Override
	public UsersDto getData(String data) {
		return usersDao.getData(data);
	}

	@Override
	public List<UsersDto> getList() {
		return null;
	}

	@Override
	public boolean pwdUpdate(UsersDto dto, String pwd) {
		String prePwd = usersDao.isValid(dto.getId());
		String inputPwd = pwd;
		boolean success = pEncoder.matches(inputPwd, prePwd);
		if(success){
			String encoderPwd = pEncoder.encode(dto.getPwd());
			dto.setPwd(encoderPwd);
			usersDao.pwdUpdate(dto);
		}
		return success;
	}
	
}
