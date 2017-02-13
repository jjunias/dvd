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
	
	private static final int PAGE_ROW_COUNT=5;
	private static final int PAGE_DISPLAY_COUNT=5;

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
		int total = ratingDao.getCount();
		pagingRating.setTotalPageCount(total);
		pagingRating.setDvd_num(num);
		pagingRating = page.Paging(pagingRating, 10);
		List<RatingDto> ratingList = ratingDao.getList(pagingRating);
		dao.viewsUp(num);
		DvdDto dto = dao.getData(num);
		mView.addObject("dvd", dto);
		mView.addObject("ratingList", ratingList);
		mView.addObject("pagingRating",pagingRating);
		
	// QnA 페이지네이션 시작
		QnaDto qnaDto = new QnaDto();
		int pageNum = ratingNum;
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = qnaDao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		//시작 row 번호와 끝 row 번호를 Dto 에 담는다.
		qnaDto.setStartRowNum(startRowNum);
		qnaDto.setEndRowNum(endRowNum);
		qnaDto.setDvd_num(num);
		
		List<QnaDto> qnaList = qnaDao.getList(qnaDto);
		mView.addObject("qnaList", qnaList);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
	// QnA 페이지네이션 끝
		
		return mView;
	}
}
