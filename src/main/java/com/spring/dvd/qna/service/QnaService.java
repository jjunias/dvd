package com.spring.dvd.qna.service;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.qna.dto.QnaDto;

public interface QnaService {
	public int insert(QnaDto dto);
	public int update(QnaDto dto);
	public int delete(int qna_num);
	public ModelAndView getList(int dvd_num);
	public QnaDto getData(int qna_num);
	
}
