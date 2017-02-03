package com.spring.dvd.basket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.basket.dto.BasketDto;

@Repository
public class BasketDaoImpl implements BasketDao{
	@Autowired
	private SqlSession session;

	@Override
	public int insert(BasketDto dto) {
		return session.insert("basket.insert", dto);
	}

	@Override
	public List<BasketDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BasketDto getData(String data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(BasketDto dto) {
		return 0;
	}
	
	@Override
	public int delete(BasketDto dto) {
		return session.delete("basket.delete", dto);
	}

	@Override
	public int delete(String data) {
		return 0;
	}
	
	
}
