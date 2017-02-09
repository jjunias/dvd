package com.spring.dvd.rating.service;

import java.util.List;

import com.spring.dvd.generic.service.GenericService;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.dao.RatingDao;
import com.spring.dvd.rating.dto.RatingDto;
import com.spring.dvd.rating.dto.RatingRecommendDto;

public interface RatingService extends GenericService<RatingDto,Integer,RatingDao> {
	public List<RatingDto> getList(RatingDto dto);
	public int RecommendInsert(RatingRecommendDto dto);
	public int Insert(RatingDto dto);
}
