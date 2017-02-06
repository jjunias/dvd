package com.spring.dvd.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dvd.generic.controller.GenericController;
import com.spring.dvd.users.dao.UsersDao;
import com.spring.dvd.users.dto.UsersDto;
import com.spring.dvd.users.service.UsersService;
import com.spring.dvd.users.validator.UsersValidator;

@Controller
@RequestMapping("users")
public class UsersController extends GenericController<UsersDto, String, UsersDao, UsersService, UsersValidator>{

	@Autowired
	private UsersService service;
	
	@RequestMapping("checkid")
	@ResponseBody
	public boolean checkid(@RequestParam String inputId){
		return service.canUseId(inputId);
	}
	
}
