package com.spring.dvd.basket.service;

import org.springframework.stereotype.Service;

import com.spring.dvd.basket.dao.BasketDao;
import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.generic.service.GenericServiceImpl;

@Service
public class BasketServiceImpl extends GenericServiceImpl<BasketDto, String, BasketDao> implements BasketService{

}
