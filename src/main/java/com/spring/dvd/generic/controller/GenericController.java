package com.spring.dvd.generic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//GenericController<T Dto 타입, K getDate 파라메터 타입,D Dao 타입 , S Service 타입 , V Validator 타입>
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.generic.service.GenericService;
import com.spring.dvd.generic.validator.GenericValidator;



public abstract class GenericController<T, K, D extends GenericDao<T, K>, S extends GenericService<T, K, D>, V extends GenericValidator> {
	@Autowired
	S service;
	@Autowired
	V validator;
		
	// 페이지 이동하는 요청에대한 맵핑
	@RequestMapping(value = "/**/", params = "type=views")
	public void MoveForm(String nation,Model model) {
		if (nation != null) {
			model.addAttribute("catalog", nation);
		}
	}

	// insert
	// return 1 이면 가입 성공 return 0 이면 가입 실패
	@RequestMapping("/insert")
	@ResponseBody
	public int Insert(@ModelAttribute T dto) {
		return service.insert(dto);
	}

	// update
	@RequestMapping("/update")
	public int Update(@ModelAttribute T dto, SessionStatus status) {
		int success = service.update(dto);
		status.setComplete();
		return success;
	}

	// delete
	@RequestMapping("/delete")
	@ResponseBody
	public int Delete(@RequestParam K num) {
		return service.delete(num);
	}
	// getData
	@RequestMapping(value = "/**/", params = "type=data")
	public void GetData(@RequestParam K data, Model model) {
		model.addAttribute("dto", service.getData(data));
	}
	// getList
	@RequestMapping(value = "/**/", params = "type=list")
	public void GetList(Model model) {
		List<T> list = service.getList();
		model.addAttribute("list", list);
	}
}
