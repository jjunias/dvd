package com.spring.dvd.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.dvd.basket.dao.BasketDao;
import com.spring.dvd.basket.dto.BasketDto;
import com.spring.dvd.movie.dto.DvdDto;

@Component
public class BasketServiceImpl implements BasketService{
	@Autowired
	private BasketDao basketDao;

	@Override
	public int insert(BasketDto dto) {
		BasketDto basDto = basketDao.getData(dto);
		if(basDto == null){
			return basketDao.insert(dto);
		}
		else{
			return 0;
		}
	}

	@Override
	public int delete(BasketDto dto) {
		return basketDao.delete(dto);
	}

	@Override
	public List<DvdDto> getList(String id) {
		List<DvdDto> list = basketDao.getList(id);
		return list;
	}
}