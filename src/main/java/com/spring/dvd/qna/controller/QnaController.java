package com.spring.dvd.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.qna.dto.QnaDto;
import com.spring.dvd.qna.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qna/qna_insert")
	@ResponseBody
	public int insert(@ModelAttribute QnaDto dto, HttpSession session) {
		//String id = (String) session.getAttribute("id");
		String id = "admin";
		dto.setQna_writer(id);
		return qnaService.insert(dto);
	}
	
	@RequestMapping("/qna/qna_update")
	@ResponseBody
	public int update(@ModelAttribute QnaDto dto){
		return qnaService.update(dto);
	}
	
	@RequestMapping("/qna/qna_delete")
	public String delete(@RequestParam int qna_num){
		qnaService.delete(qna_num);
		return "redirect:/product/product_info.do?productNum=";
	}
	
	@RequestMapping("/qna/qna_list")
	public ModelAndView getList(@RequestParam int dvd_num){
		ModelAndView mView = qnaService.getList(dvd_num);
		mView.setViewName("qna/list");
		return mView;
	}
	
	@RequestMapping("/qna/qna_detail")
	public ModelAndView detail(@RequestParam int qna_num){
		QnaDto dto = qnaService.getData(qna_num);
		ModelAndView mView = new ModelAndView();
		mView.addObject(dto);
		mView.setViewName("qna/detail");
		return mView;
	}
}
