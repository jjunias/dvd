package com.spring.dvd.basket.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.basket.service.BasketService;
import com.spring.dvd.movie.dto.DvdDto;

@Controller
@RequestMapping("basket")
public class BasketController {
	@Autowired
	private BasketService basketService;
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(@RequestParam int dvd_num, HttpSession session){
		BasketDto dto = new BasketDto();
		String id = (String) session.getAttribute("id");
		dto.setId(id);
		dto.setDvd_num(dvd_num);
		return basketService.insert(dto);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(@ModelAttribute BasketDto dto){
		return basketService.delete(dto);
	}
	
	@RequestMapping("/list")
	public ModelAndView getList(String id){
		ModelAndView mView = new ModelAndView();
		List<DvdDto> list = basketService.getList(id);
		mView.addObject("list", list);
		mView.setViewName("basket/list");
		return mView;
	}
}
