package com.spring.dvd.basket.service;

import java.util.List;

import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.movie.dto.DvdDto;

public interface BasketService {
	public int insert(BasketDto dto);
	public int delete(BasketDto dto);
	public int update(BasketDto dto);
	public List<DvdDto> getList(String id);
	public DvdDto getData2(int basket_num);
}
