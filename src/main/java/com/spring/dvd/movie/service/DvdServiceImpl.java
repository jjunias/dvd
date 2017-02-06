package com.spring.dvd.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.instrument.classloading.tomcat.TomcatLoadTimeWeaver;
import org.springframework.stereotype.Service;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.movie.common.DvdFileUtils;
import com.spring.dvd.movie.common.DvdPagenation;
import com.spring.dvd.movie.common.DvdSearch;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;

@Service
public class DvdServiceImpl extends GenericServiceImpl<DvdDto, Integer, DvdDao> implements DvdService {
	@Autowired
	DvdDao dao;
	@Autowired
	DvdFileUtils file;  //파일 업로드
	@Autowired
	DvdPagenation page;  //페이징 처리
	@Autowired
	DvdSearch search; // 검색

	@Override
	public int insert(HttpServletRequest request, DvdDto dto) {
		dto = file.Files(request, dto);
		return dao.insert(dto);
	}

	@Override
	public int update(HttpServletRequest request, DvdDto dto) {
		dto = file.Files(request, dto);
		return dao.update(dto);
	}

	@Override
	public List<DvdDto> getList(DvdDto dto) {
		// TODO Auto-generated method stub
		dto.setTotalPageCount(dao.getCount()); //DB 전체 갯수를 넣어줌
		page.Paging(dto);
		search.Search(dto);
		return dao.getList(dto);
	}
}
