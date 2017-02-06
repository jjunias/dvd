package com.spring.dvd.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.qna.dto.QnaDto;
import com.spring.dvd.qna.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qna/insert")
	public String insert(@ModelAttribute QnaDto dto, HttpSession session) {
		String id = (String) session.getAttribute("id");
		dto.setQna_writer(id);
		qnaService.insert(dto);
		return "redirect:/product/product_info.do?productNum="+dto.getDvd_num();
	}
	
	@RequestMapping("/qna/update")
	public String update(@ModelAttribute QnaDto dto){
		qnaService.update(dto);
		return "redirect:/product/product_info.do?productNum="+dto.getDvd_num();
	}
	
	@RequestMapping("/qna/delete")
	public String delete(@RequestParam int qna_num){
		qnaService.delete(qna_num);
		return "redirect:/product/product_info.do?productNum=";
	}
	
	@RequestMapping("/qna/list")
	public ModelAndView getList(@RequestParam int dvd_num){
		ModelAndView mView = qnaService.getList(dvd_num);
		mView.setViewName("qna/list");
		return mView;
	}
	
	@RequestMapping("/qna/detail")
	public ModelAndView detail(@RequestParam int qna_num){
		QnaDto dto = qnaService.getData(qna_num);
		ModelAndView mView = new ModelAndView();
		mView.addObject(dto);
		mView.setViewName("qna/detail");
		return mView;
	}
}
