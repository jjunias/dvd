package com.spring.dvd.basket.service;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.basket.dto.BasketDto;

public interface BasketService {
	public int insert(BasketDto dto);
	public int delete(BasketDto dto);
	public ModelAndView getList(String id);
}
