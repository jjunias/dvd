package com.spring.dvd.payment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.basket.service.BasketService;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.movie.service.DvdService;
import com.spring.dvd.users.service.UsersService;


@Controller
public class paymentController {

	@Autowired
	private UsersService userService;
	@Autowired
	private DvdService dvdService;
	@Autowired
	private BasketService basketService;
	
	@RequestMapping("/users/pay")
	public void getList(int num,HttpSession session,Model model){
	 	String id = (String) session.getAttribute("id");
	 	model.addAttribute("users", userService.getData(id));
	 	model.addAttribute("dvd",dvdService.getData(num));
	}
	
	@RequestMapping("/users/cart_pay")
	public void cartList(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		List<DvdDto> list = basketService.getList(id);
		model.addAttribute("list", list);
	}
	
}
