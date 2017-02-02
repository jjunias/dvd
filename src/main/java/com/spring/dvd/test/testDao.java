package com.spring.dvd.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.generic.dao.GenericDao;

@Repository
public class testDao implements GenericDao<testDto, String> {
	@Autowired
	SqlSession session;

	@Override
	public int insert(testDto dto) {
		// TODO Auto-generated method stub
		return session.insert("test.insert", dto);
	}

	@Override
	public List<testDto> getList() {
		// TODO Auto-generated method stub
		return session.selectList("test.getList");
	}

	@Override
	public testDto getData(String num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(testDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
