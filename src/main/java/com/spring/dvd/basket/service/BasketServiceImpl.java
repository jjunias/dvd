package com.spring.dvd.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dvd.basket.dao.BasketDao;
import com.spring.dvd.basket.dto.BasketDto;

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
	public ModelAndView getList(String id) {
		List<BasketDto> list = basketDao.getList(id);
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", list);
		return mView;
	}
}
