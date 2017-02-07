package com.spring.dvd.generic.common;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.generic.dto.GenericDto;

public abstract class Pagenation<T extends GenericDto,K,D extends GenericDao<T, K>>{
	D dao;
	
	public T Paging(T dto,int row) {
		//한 페이지에 나타낼 로우의 갯수
		final int PAGE_ROW_COUNT=row;
		
		//하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT=5;	
		int startRowNum=1+(dto.getPageNum()-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=dto.getPageNum()*PAGE_ROW_COUNT;
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(dto.getTotalPageCount()/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((dto.getPageNum()-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		//시작 row 번호와 끝 row 번호를 CafeDto 에 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setStartPageNum(startPageNum);
		dto.setEndPageNum(endPageNum);
		dto.setTotalPageCount(totalPageCount);
		return dto;
	}
}
