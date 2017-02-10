package com.spring.dvd.basket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.movie.dto.DvdDto;

@Repository
public class BasketDaoImpl implements BasketDao {
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
	public List<DvdDto> getList(String id) {
		List<DvdDto> list = session.selectList("basket.getList", id);
		return list;
	}
}
