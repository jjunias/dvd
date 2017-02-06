package com.spring.dvd.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	// insert
		// return 1 이면 가입 성공 return 0 이면 가입 실패
		@RequestMapping("/insert")
		@ResponseBody
		public int Insert(@ModelAttribute UsersDto dto) {
			return service.insert(dto);
		}
	
	@RequestMapping("/login")
	@ResponseBody
	public boolean login(@ModelAttribute UsersDto dto,HttpSession session){
		boolean success = service.isValid(dto);
		if(success){
			session.setAttribute("id", dto.getId());
			return success;
		}else{
			return success;
		}		
	}
	
	
	
}
