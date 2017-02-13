package com.spring.dvd.movie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.instrument.classloading.tomcat.TomcatLoadTimeWeaver;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.movie.common.DvdFileUtils;
import com.spring.dvd.movie.common.DvdPagenation;
import com.spring.dvd.movie.common.DvdSearch;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.dao.RatingDao;
import com.spring.dvd.rating.dto.RatingDto;

@Service
public class DvdServiceImpl extends GenericServiceImpl<DvdDto, Integer, DvdDao> implements DvdService {
	@Autowired
	DvdDao dao;
	@Autowired
	RatingDao ratingDao;
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
	public ModelAndView getList(DvdDto dto) {
		// TODO Auto-generated method stub
		if("".equals(dto.getGenre())){
			dto.setGenre(null);
		}
		if("".equals(dto.getNational())){
			dto.setNational(null);
		}
		search.Search(dto);  //키워드 의값을 title에 넣어줌
		dto.setTotalPageCount(dao.getCount(dto)); //DB 전체 갯수를 넣어줌
		page.Paging(dto,12);   // 얻어온 count 에 맞게 페이징처리
		ModelAndView mView = new ModelAndView();
		mView.addObject("paging", dto);
		List<DvdDto> list = dao.getList(dto);
		mView.addObject("list",list);
		return mView;
	}
	@Override
	public ModelAndView getData(int num,int ratingNum){
		ModelAndView mView = new ModelAndView();
		DvdDto pagingRating = new DvdDto();
		pagingRating.setPageNum(ratingNum);
		int total = ratingDao.getCount(num);
		pagingRating.setTotalPageCount(total);
		pagingRating.setDvd_num(num);
		pagingRating = page.Paging(pagingRating,5);
		List<RatingDto> ratingList = ratingDao.getList(pagingRating);
		dao.viewsUp(num);
		DvdDto dto = dao.getData(num);
		mView.addObject("dvd", dto);
		mView.addObject("ratingList", ratingList);
		mView.addObject("pagingRating",pagingRating);
		return mView;
	}
}
