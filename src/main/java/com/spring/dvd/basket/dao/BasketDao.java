package com.spring.dvd.basket.dao;

import java.util.List;

import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.movie.dto.DvdDto;

public interface BasketDao {

	public int insert(BasketDto dto);
	public int delete(BasketDto dto);
	public List<DvdDto> getList(String id);
	public BasketDto getData(BasketDto dto);
}
