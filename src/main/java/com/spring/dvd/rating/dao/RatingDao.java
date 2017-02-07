package com.spring.dvd.rating.dao;

import java.util.List;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.dto.RatingDto;

public interface RatingDao extends GenericDao<RatingDto,Integer> {
	public List<RatingDto> getList(DvdDto dto);
	public List<RatingDto> getList(RatingDto dto);
}
