package com.spring.dvd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.movie.service.DvdService;

@Controller
public class HomeController {
	@Autowired
	DvdService service;
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView  mView = service.mainData();
		return mView;
	}
}
