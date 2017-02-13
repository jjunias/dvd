package com.spring.dvd.movie.dao;

import java.util.List;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.movie.dto.DvdDto;

public interface DvdDao extends GenericDao<DvdDto,Integer>{
	public List<DvdDto> getList(DvdDto dto);
	public int getCount(DvdDto dto);
	public void  viewsUp(int num);
}
