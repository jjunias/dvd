package com.spring.dvd.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.dvd.qna.dao.QnaDao;

@Component
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDao qnaDao;
}
