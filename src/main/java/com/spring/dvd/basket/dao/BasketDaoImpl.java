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
	public int delete(BasketDto dto) {
		return session.delete("basket.delete", dto);
	}

	@Override
	public List<BasketDto> getList(String id) {
		List<BasketDto> list = session.selectList("basket.getList", id);
		return list;
	}
}
