package com.spring.dvd.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.qna.dao.QnaDao;
import com.spring.dvd.qna.dto.QnaDto;

@Component
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDao qnaDao;

	@Override
	public int insert(QnaDto dto) {
		return qnaDao.insert(dto);
	}

	@Override
	public int a_update(QnaDto dto) {
		return qnaDao.a_update(dto);
	}
	
	@Override
	public int q_update(QnaDto dto) {
		return qnaDao.q_update(dto);
	}
	
	@Override
	public int a_delete(int qna_num) {
		return qnaDao.a_delete(qna_num);
	}

	@Override
	public int q_delete(int qna_num) {
		return qnaDao.q_delete(qna_num);
	}

	@Override
	public ModelAndView getList(int dvd_num) {
		List<QnaDto> list = qnaDao.getList(dvd_num);
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		return mView;
	}

	@Override
	public QnaDto getData(int qna_num) {
		QnaDto dto = qnaDao.getData(qna_num);
		return dto;
	}
	
	
}
