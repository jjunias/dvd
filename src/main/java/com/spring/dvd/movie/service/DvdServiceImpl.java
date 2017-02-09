package com.spring.dvd.movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.generic.service.GenericServiceImpl;
import com.spring.dvd.movie.common.DvdFileUtils;
import com.spring.dvd.movie.common.DvdPagenation;
import com.spring.dvd.movie.common.DvdSearch;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.qna.dao.QnaDao;
import com.spring.dvd.qna.dto.QnaDto;
import com.spring.dvd.rating.dao.RatingDao;
import com.spring.dvd.rating.dto.RatingDto;

@Service
public class DvdServiceImpl extends GenericServiceImpl<DvdDto, Integer, DvdDao> implements DvdService {
	@Autowired
	DvdDao dao;
	@Autowired
	RatingDao ratingDao;
	@Autowired
	QnaDao qnaDao;
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
		page.Paging(dto,8);
		search.Search(dto);
		return dao.getList(dto);
	}
	@Override
	public ModelAndView getData(int num,int ratingNum){
		ModelAndView mView = new ModelAndView();
		
		DvdDto pagingRating = new DvdDto();
		pagingRating.setPageNum(ratingNum);
		int total = ratingDao.getCount();
		pagingRating.setTotalPageCount(total);
		pagingRating.setDvd_num(num);
		pagingRating = page.Paging(pagingRating, 10);
		List<RatingDto> ratingList = ratingDao.getList(pagingRating);
		List<QnaDto> qnaList = qnaDao.getList(num);
		DvdDto dto = dao.getData(num);
		mView.addObject("dvd", dto);
		mView.addObject("ratingList", ratingList);
		mView.addObject("pagingRating",pagingRating);
		mView.addObject("qnaList", qnaList);
		return mView;
	}
}
