package com.spring.dvd.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.qna.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public int insert(QnaDto dto) {
		return session.insert("qna.insert", dto);
	}

	@Override
	public int update(QnaDto dto) {
		return session.update("qna.update", dto);
	}

	@Override
	public int delete(int num) {
		return session.delete("qna.delete", num);
	}

	@Override
	public List<QnaDto> getList() {

		return null;
	}

	@Override
	public QnaDto getData(int num) {

		return null;
	}
	
}
