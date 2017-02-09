package com.spring.dvd.rating.dao;

import java.util.List;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.dto.RatingDto;
import com.spring.dvd.rating.dto.RatingRecommendDto;

public interface RatingDao extends GenericDao<RatingDto,Integer> {
	public List<RatingDto> getList(DvdDto dto);
	public List<RatingDto> getList(RatingDto dto);
	public int RecommendInsert(RatingRecommendDto dto);
	public boolean idCheck(RatingRecommendDto dto);
	public int recommendCount(RatingRecommendDto dto);
	public void recommendUpdate(RatingRecommendDto dto);
	public float averageDvd(RatingDto dto);
	public void averageUpdate(RatingDto dto);
}
