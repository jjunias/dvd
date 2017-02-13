package com.spring.dvd.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.generic.controller.GenericController;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.movie.service.DvdService;
import com.spring.dvd.movie.validator.DvdValidator;
import com.spring.dvd.rating.service.RatingService;

@Controller
@RequestMapping("movie")
@SessionAttributes("dvd")
public class DvdController extends GenericController<DvdDto, Integer, DvdDao, DvdService, DvdValidator> {
	@Autowired
	DvdService service;
	@Autowired
	RatingService ratingService;

	// insert
	@RequestMapping("/admin/insert")
	public String Insert(HttpServletRequest request, @ModelAttribute DvdDto dto) {
		service.insert(request, dto);
		String national = dto.getNational();
		return "redirect:/movie/movie_main.do?type=list&national=" + national;
	}

	// 리스트 가져오기
	@RequestMapping(value = "/**/", params = "type=list")
	public ModelAndView getList(@ModelAttribute DvdDto dto, @RequestParam(defaultValue = "1") int num,@RequestParam(defaultValue = "") String sort
			,@RequestParam(defaultValue = "") String page ) {
		if(sort.equals("grade")){
			dto.setGrade(1);
		}else if(sort.equals("view")){
			dto.setViews(1);
		}
		dto.setPageNum(num);
		ModelAndView mView = service.getList(dto);
		return mView;
	}

	// 상세보기
	@RequestMapping(value = "/detail_form")
	public ModelAndView getData(@RequestParam int num,@RequestParam(defaultValue = "1") int ratingNum, @RequestParam(defaultValue = "1") int qnaNum,
			@RequestParam(defaultValue = "1") String scroll) {
		ModelAndView mView = service.getData(num,ratingNum,qnaNum,scroll);
		return mView;
	}

	// 업데이트 FORM
	@RequestMapping(value = "/admin/update_form")
	public void Update_form(@RequestParam int num, Model model) {
		
	}

	// 업데이트
	@RequestMapping("/admin/update")
	public String Update(@ModelAttribute("dvd") DvdDto dvdUpdate, HttpServletRequest request,
			SessionStatus status) {
		service.update(request, dvdUpdate);
		status.setComplete();
		return "redirect:/movie/detail_form.do?num=" + dvdUpdate.getNum();

	}

	@RequestMapping("/admin/delete")
	public String Delete(@ModelAttribute("dvdUpdate") DvdDto dvdUpdate, SessionStatus status) {
		service.delete(dvdUpdate.getNum());
		String national = dvdUpdate.getNational();
		status.setComplete();
		return "redirect:/movie/movie_main.do?type=list&national=" + national;
	}
}
