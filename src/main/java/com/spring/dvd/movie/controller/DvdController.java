package com.spring.dvd.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dvd.generic.controller.GenericController;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.movie.service.DvdService;
import com.spring.dvd.movie.validator.DvdValidator;

@Controller
@RequestMapping("movie")
public class DvdController extends GenericController<DvdDto,Integer, DvdDao,DvdService,DvdValidator>{
	@Autowired
	DvdService service;
	
	@RequestMapping("/admin/insert")
	@ResponseBody
	public int Insert(HttpServletRequest request,DvdDto dto){
		System.out.println(dto.getMyFile());
		return 0;
	}
}
