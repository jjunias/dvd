package com.spring.dvd.generic.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.dvd.movie.dto.DvdDto;
import com.spring.dvd.rating.dto.RatingDto;

//GenericService< T dto 타입 정의 , getData의 파라메터 타입 정의 , D Dao 타입 정의
public interface GenericService<T, K, D> {
	public int insert(T dto);
	public int update(T dto);
	public int delete(K data);
	public T getData(K data);
	public List<T> getList();
}
