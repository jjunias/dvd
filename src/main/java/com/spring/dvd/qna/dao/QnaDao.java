package com.spring.dvd.qna.dao;

import java.util.List;

import com.spring.dvd.qna.dto.QnaDto;

public interface QnaDao {
	public int insert(QnaDto dto);
	public int update(QnaDto dto);
	public int delete(int num);
	public List<QnaDto> getList();
	public QnaDto getData(int num);
}
