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
	public int delete(int qna_num) {
		return session.delete("qna.delete", qna_num);
	}

	@Override
	public List<QnaDto> getList(int dvd_num) {
		List<QnaDto> list = session.selectList("qna.getList");
		return list;
	}

	@Override
	public QnaDto getData(int qna_num) {
		QnaDto dto = session.selectOne("qna.getData", qna_num);
		return dto;
	}
	
}
