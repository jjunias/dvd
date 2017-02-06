package com.spring.dvd.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.movie.dto.DvdDto;

@Repository
public class DvdDaoImpl implements DvdDao {
	@Autowired
	SqlSession session;

	@Override
	public int insert(DvdDto dto) {
		// TODO Auto-generated method stub
		return session.insert("dvd.insert", dto);
	}

	@Override
	public List<DvdDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DvdDto getData(Integer data) {
		// TODO Auto-generated method stub
		return session.selectOne("dvd.getData",data);
	}

	@Override
	public int update(DvdDto dto) {
		// TODO Auto-generated method stub
		return session.update("dvd.update",dto);
	}

	@Override
	public int delete(Integer data) {
		// TODO Auto-generated method stub
		return session.delete("dvd.delete",data);
	}

	@Override
	public List<DvdDto> getList(DvdDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("dvd.getList",dto);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("dvd.getCount");
	}

}
