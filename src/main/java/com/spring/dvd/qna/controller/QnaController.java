package com.spring.dvd.qna.controller;

import java.util.List;

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
@RequestMapping("movie/qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/qna_insert")
	@ResponseBody
	public int insert(@ModelAttribute QnaDto dto, HttpSession session) {
		String id = (String) session.getAttribute("id");
		dto.setQna_writer(id);
		return qnaService.insert(dto);
	}
	
	@RequestMapping("/a_update")
	@ResponseBody
	public int a_update(@ModelAttribute QnaDto dto){
		return qnaService.a_update(dto);
	}
	
	@RequestMapping("/q_update")
	@ResponseBody
	public int q_update(@ModelAttribute QnaDto dto){
		return qnaService.q_update(dto);
	}
	
	@RequestMapping("/a_delete")
	@ResponseBody
	public int a_delete(@RequestParam int qna_num){
		return qnaService.a_delete(qna_num);
	}
	
	@RequestMapping("/q_delete")
	@ResponseBody
	public int q_delete(@RequestParam int qna_num){
		return qnaService.q_delete(qna_num);
	}
	
	@RequestMapping("/qna_list")
	public ModelAndView getList(@RequestParam int dvd_num){
		ModelAndView mView = new ModelAndView(); 
		List<QnaDto> list = qnaService.getList(dvd_num);
		mView.addObject("qnaList", list);
		mView.setViewName("qna/qnalist");
		return mView;
	}
	
	@RequestMapping("/qna_detail")
	public ModelAndView detail(@RequestParam int qna_num){
		QnaDto dto = qnaService.getData(qna_num);
		ModelAndView mView = new ModelAndView();
		mView.addObject(dto);
		mView.setViewName("qna/detail");
		return mView;
	}
}
