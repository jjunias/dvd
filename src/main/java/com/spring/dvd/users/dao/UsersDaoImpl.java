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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsersDto getData(String id) {
		// TODO Auto-generated method stub
		UsersDto dto = new UsersDto();

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

	public boolean canUseId(String id) {
		// 인자로 전달된 아이디를 DB 에서 select 해본다.
		String selectedId = session.selectOne("users.isExistId", id);
		if (selectedId == null) {// 없으면
			return true;// 사용가능한 아이디이다.
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
		// TODO Auto-generated method stub
		return 0;
	}

}
