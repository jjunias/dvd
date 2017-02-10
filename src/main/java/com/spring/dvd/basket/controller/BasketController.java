package com.spring.dvd.basket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.basket.service.BasketService;
import com.spring.dvd.movie.dto.DvdDto;

@Controller
public class BasketController {
	@Autowired
	private BasketService basketService;
	
	@RequestMapping("/basket/private/insert")
	public ModelAndView insert(@ModelAttribute BasketDto dto){
		basketService.insert(dto);
		// dvd detail 페이지로 이동
		return new ModelAndView("redirect:/basket/list.do");
	}
	
	@RequestMapping("/basket/private/delete")
	public ModelAndView delete(@ModelAttribute BasketDto dto){
		basketService.delete(dto);
		return new ModelAndView("redirect:/basket/list.do");
	}
	
	@RequestMapping("/basket/list")
	public ModelAndView getList(String id){
		ModelAndView mView = new ModelAndView();
		List<DvdDto> list = basketService.getList(id);
		mView.addObject("list", list);
		mView.setViewName("basket/list");
		return mView;
	}
}
