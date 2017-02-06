package com.spring.dvd.generic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.generic.dto.GenericDto;

public abstract class GenericServiceImpl<T , K, D extends GenericDao<T, K>>
		implements GenericService<T, K, D> {
	@Autowired
	D dao;
	

	public int insert(T dto) {
		return dao.insert(dto);
	}

	public int update(T dto) {
		return dao.update(dto);
	}

	public int delete(K data) {

		return dao.delete(data);
	}

	public List<T> getList() {

		return dao.getList();
	}

	public T getData(K data) {
		return dao.getData(data);
	}

}
