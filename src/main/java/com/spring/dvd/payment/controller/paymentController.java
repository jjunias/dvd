package com.spring.dvd.payment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dvd.basket.dto.BasketDto;
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
	public void cartList(@RequestParam(value="check_sub") List<Integer> check, @RequestParam(value="basket_num") List<Integer> basket_num, HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		model.addAttribute("users", userService.getData(id));
		List<DvdDto> basket_list = new ArrayList<DvdDto>();
		DvdDto dvdDto = new DvdDto();
		for(int i=0;i<check.size();i++){
			dvdDto = dvdService.getData((Integer)check.get(i));
			dvdDto.setBasket_num((Integer)basket_num.get(i));
			basket_list.add(dvdDto);
		}
		model.addAttribute("basket_list", basket_list);
	}
	
	@RequestMapping("/users/complete_pay.do")
	public void complete(String scroll, @RequestParam List<Integer> list, @RequestParam List<Integer> list2, @RequestParam List<Integer> list3, HttpSession session ,Model model){
		String id = (String) session.getAttribute("id");
		List<DvdDto> dtoList =  new ArrayList<DvdDto>();
		BasketDto basketDto = new BasketDto();
		DvdDto dvdDto = new DvdDto(); 
		basketDto.setId(id);
		for(int i=0;i<list.size();i++){
			basketDto.setDvd_num((Integer) list.get(i));
			basketDto.setCount((Integer) list2.get(i));
			basketService.update(basketDto);
			dvdDto = basketService.getData2((Integer) list3.get(i));
			dtoList.add(i, dvdDto);
		}
		model.addAttribute("scroll", scroll);
		model.addAttribute("dtoList", dtoList);
	}
	
	@RequestMapping("/users/complete_pay2.do")
	public void complete2(String scroll, @RequestParam int dvd_num, @RequestParam int count, HttpSession session){
		String id = (String) session.getAttribute("id");
		BasketDto basketDto = new BasketDto();
		DvdDto dvdDto = new DvdDto();
		basketDto.setId(id);
		basketDto.setDvd_num(dvd_num);
		basketService.insert(basketDto);
		basketDto.setCount(count);
		basketService.update(basketDto);
		
	}
	
	
}
