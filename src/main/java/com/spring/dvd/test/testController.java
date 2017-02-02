package com.spring.dvd.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.dvd.generic.controller.GenericController;

@Controller
public class testController extends GenericController<testDto, String, testDao, testService, testValiadator>{
	@Autowired
	testService service;
	@Autowired
	testValiadator validator;
}
