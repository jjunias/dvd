package com.spring.dvd.qna.dao;

import java.util.List;

import com.spring.dvd.qna.dto.QnaDto;

public interface QnaDao {
	public int insert(QnaDto dto);
	public int a_update(QnaDto dto);
	public int q_update(QnaDto dto);
	public int a_delete(int qna_num);
	public int q_delete(int qna_num);
	public List<QnaDto> getList(QnaDto dto);
	public QnaDto getData(int qna_num);
	public int getCount();
}
