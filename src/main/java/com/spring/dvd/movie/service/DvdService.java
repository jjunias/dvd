package com.spring.dvd.movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.dvd.generic.service.GenericService;
import com.spring.dvd.movie.common.DvdFileUtils;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;

public interface DvdService extends GenericService<DvdDto,Integer,DvdDao>{
	public int insert(HttpServletRequest request,DvdDto dto);
	public int update(HttpServletRequest request,DvdDto dto);
	public List<DvdDto> getList(DvdDto dto);
}
