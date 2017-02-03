package com.spring.dvd.basket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dvd.basket.dao.BasketDao;
import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.basket.service.BasketService;
import com.spring.dvd.basket.validator.BasketValidator;
import com.spring.dvd.generic.controller.GenericController;

@Controller
@RequestMapping("basket")
public class BasketController extends GenericController<BasketDto, String, BasketDao, BasketService, BasketValidator>{
	@Autowired
	private BasketService basketService;
}
