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

import com.spring.dvd.generic.controller.GenericController;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.movie.service.DvdService;
import com.spring.dvd.movie.validator.DvdValidator;

@Controller
@RequestMapping("movie")
@SessionAttributes("dvdUpdate")
public class DvdController extends GenericController<DvdDto, Integer, DvdDao, DvdService, DvdValidator> {
	@Autowired
	DvdService service;
	
	// insert 
	@RequestMapping("/admin/insert")
	public String Insert(HttpServletRequest request, @ModelAttribute DvdDto dto) {
		service.insert(request, dto);
		String national = dto.getNational();
		if ("domestic".equals(national)) {
			return "redirect:/movie/domestic_main.do?type=list&national=" + national;
		} else {
			return "redirect:/movie/overseas_main.do?type=list&national=" + national;
		}
	}
	//리스트 가져오기
	@RequestMapping(value = "/**/", params = "type=list")
	public void getList(@ModelAttribute DvdDto dto,@RequestParam(defaultValue="1") int num ,Model model) {
		dto.setPageNum(num);
		List<DvdDto> list = service.getList(dto);
		model.addAttribute("list", list);
	}
	//상세보기
	@RequestMapping(value="/detail_form")
	public void getData(@RequestParam int num, Model model) {
		DvdDto dvd = service.getData(num);
		model.addAttribute("dvd", dvd);
	}
	//업데이트 FORM
	@RequestMapping(value="/admin/update_form")
	public void Update_form(@RequestParam int num, Model model) {
		DvdDto dvd = service.getData(num);
		model.addAttribute("dvdUpdate", dvd);
	}
	//업데이트
	@RequestMapping("/admin/update")
	public String Update(@ModelAttribute("dvdUpdate") DvdDto dvdUpdate,HttpServletRequest request,SessionStatus status){
		service.update(request, dvdUpdate);
		status.setComplete();
		return "redirect:/movie/detail_form.do?num="+dvdUpdate.getNum();
		
	}
	@RequestMapping("/admin/delete")
	public String Delete(@ModelAttribute("dvdUpdate") DvdDto dvdUpdate,SessionStatus status){
		service.delete(dvdUpdate.getNum());
		String national = dvdUpdate.getNational();
		status.setComplete();
		if ("domestic".equals(national)) {
			return "redirect:/movie/domestic_main.do?type=list&national=" + national;
		} else {
			return "redirect:/movie/overseas_main.do?type=list&national=" + national;
		}
	}
}
