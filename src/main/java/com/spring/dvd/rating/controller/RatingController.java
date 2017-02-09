package com.spring.dvd.rating.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dvd.generic.controller.GenericController;
import com.spring.dvd.rating.dao.RatingDao;
import com.spring.dvd.rating.dto.RatingDto;
import com.spring.dvd.rating.dto.RatingRecommendDto;
import com.spring.dvd.rating.service.RatingService;
import com.spring.dvd.rating.validator.RatingValidator;

@Controller
@RequestMapping("movie/rating")
public class RatingController extends GenericController<RatingDto, Integer, RatingDao, RatingService, RatingValidator> {
	@Autowired
	RatingService service;

	@RequestMapping("/insert")
	@ResponseBody
	public int Insert(@ModelAttribute RatingDto dto, HttpSession session) {
		String id = (String) session.getAttribute("id");
		dto.setWriter(id);
		return service.Insert(dto);
	}

	@RequestMapping("/getList")
	@ResponseBody
	public List<RatingDto> getList(@ModelAttribute RatingDto dto) {

		return service.getList(dto);
	}
	
	@RequestMapping("/private/recommendUp")
	@ResponseBody
	public int recommendUp(@ModelAttribute RatingRecommendDto dto,HttpSession session){
		String id = (String) session.getAttribute("id");
		dto.setUserId(id);
		return service.RecommendInsert(dto);
	}

}
