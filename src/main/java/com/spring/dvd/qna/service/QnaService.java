package com.spring.dvd.qna.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.qna.dto.QnaDto;

public interface QnaService {
	public int insert(QnaDto dto);
	public int a_update(QnaDto dto);
	public int q_update(QnaDto dto);
	public int a_delete(int qna_num);
	public int q_delete(int qna_num);
	public List<QnaDto> getList(int dvd_num);
	public QnaDto getData(int qna_num);
	
}
