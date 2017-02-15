package com.spring.dvd.rating.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.dto.RatingDto;
import com.spring.dvd.rating.dto.RatingRecommendDto;
@Repository
public class RatingDaoImpl implements RatingDao {
	@Autowired
	SqlSession session;
	
	@Override
	public int insert(RatingDto dto) {
		// TODO Auto-generated method stub
		return session.insert("rating.insert",dto);
	}

	@Override
	public List<RatingDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RatingDto getData(Integer data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(RatingDto dto) {
		// TODO Auto-generated method stub
		return session.update("rating.update",dto);
	}

	@Override
	public int delete(Integer data) {
		// TODO Auto-generated method stub
		return session.delete("rating.delete",data);
	}

	@Override
	public int getCount(int dvd_num) {
		// TODO Auto-generated method stub
		return session.selectOne("rating.getCount",dvd_num);
	}

	@Override
	public List<RatingDto> getList(DvdDto dto) {
		// TODO Auto-generated method stub
		
		return session.selectList("rating.getList",dto);
		
	}

	@Override
	public List<RatingDto> getList(RatingDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("rating.getList",dto);

	}

	@Override
	public int RecommendInsert(RatingRecommendDto dto) {
		// TODO Auto-generated method stub
		return session.insert("rating.recommendInsert",dto);
	}

	@Override
	public boolean idCheck(RatingRecommendDto dto) {

		String id = session.selectOne("rating.idCheck",dto);
		
		if(null == id){
			return true;
		}
		return false;
	}

	@Override
	public int recommendCount(RatingRecommendDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("rating.recommendCount",dto);
	}

	@Override
	public void recommendUpdate(RatingRecommendDto dto) {
		// TODO Auto-generated method stub
		session.update("rating.recommendUpdate",dto);
		
	}

	@Override
	public float averageDvd(RatingDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("rating.average",dto);
	}

	@Override
	public void averageUpdate(RatingDto dto) {
		// TODO Auto-generated method stub
		session.update("rating.averageUpdate",dto);
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
