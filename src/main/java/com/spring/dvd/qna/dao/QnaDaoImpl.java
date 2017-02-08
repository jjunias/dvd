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
	public int a_update(QnaDto dto) {
		return session.update("qna.a_update", dto);
	}
	
	@Override
	public int q_update(QnaDto dto) {
		return session.update("qna.q_update", dto);
	}

	@Override
	public int a_delete(int qna_num) {
		return session.delete("qna.a_delete", qna_num);
	}
	
	@Override
	public int q_delete(int qna_num) {
		return session.delete("qna.q_delete", qna_num);
	}

	@Override
	public List<QnaDto> getList(int dvd_num) {
		List<QnaDto> list = session.selectList("qna.getList", dvd_num);
		return list;
	}

	@Override
	public QnaDto getData(int qna_num) {
		QnaDto dto = session.selectOne("qna.getData", qna_num);
		return dto;
	}
	
}
