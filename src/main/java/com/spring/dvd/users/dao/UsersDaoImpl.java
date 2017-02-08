package com.spring.dvd.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insert(UsersDto dto) {
		return session.insert("users.insert", dto);
	}

	@Override
	public List<UsersDto> getList() {

		return null;
	}

	@Override
	public UsersDto getData(String id) {

		return session.selectOne("users.getData", id);
	}

	@Override
	public int update(UsersDto dto) {
		
		return session.update("users.update",dto);
	}

	@Override
	public int delete(String id) {
		
		return session.delete("users.delete",id);
	}

	public boolean canUseId(String id) {
		String selectedId = session.selectOne("users.isExistId", id);
		if (selectedId == null) {
			return true;
		} else {
			return false;
		}
	}


	public String isValid(String id) {
		System.out.println("2번");
		return session.selectOne("users.login", id);
	}

	@Override
	public int getCount() {

		return 0;
	}

	@Override
	public String getPassword(String id) {
		String password=session.selectOne("users.getPwd", id);
		
		return password;
	}

	@Override
	public int pwdUpdate(UsersDto dto) {
		
		return session.update("users.pwdUpdate",dto);
	}

}
