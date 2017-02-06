package com.spring.dvd.movie.common;

import org.springframework.stereotype.Component;

import com.spring.dvd.generic.common.Pagenation;
import com.spring.dvd.movie.dao.DvdDao;
import com.spring.dvd.movie.dto.DvdDto;

@Component
public class DvdPagenation extends Pagenation<DvdDto,Integer,DvdDao> {

}
