package com.spring.dvd.rating.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.common.RatingPagenation;
import com.spring.dvd.rating.dao.RatingDao;
import com.spring.dvd.rating.dto.RatingDto;

@Service
public class RatingServiceImpl extends GenericServiceImpl<RatingDto,Integer,RatingDao> implements RatingService {
	@Autowired
	RatingDao dao;
	@Autowired
	RatingPagenation page;
	@Override
	public List<RatingDto> getList(RatingDto dto) {
		// TODO Auto-generated method stub
		
		dto.setTotalPageCount(dao.getCount()); //DB 전체 갯수를 넣어줌
		dto = page.Paging(dto,10);
		List<RatingDto> list = dao.getList(dto);
		return list;
	}
}
