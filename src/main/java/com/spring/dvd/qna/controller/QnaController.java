package com.spring.dvd.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.dvd.qna.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
}
