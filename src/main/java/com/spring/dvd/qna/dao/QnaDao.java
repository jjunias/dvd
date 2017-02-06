package com.spring.dvd.qna.dao;

import java.util.List;

import com.spring.dvd.qna.dto.QnaDto;

public interface QnaDao {
	public int insert(QnaDto dto);
	public int update(QnaDto dto);
	public int delete(int qna_num);
	public List<QnaDto> getList(int dvd_num);
	public QnaDto getData(int qna_num);
}
