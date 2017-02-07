package com.spring.dvd.rating.common;

import org.springframework.stereotype.Component;

import com.spring.dvd.generic.common.Pagenation;
import com.spring.dvd.rating.dao.RatingDao;
import com.spring.dvd.rating.dto.RatingDto;

@Component
public class RatingPagenation extends Pagenation<RatingDto,Integer,RatingDao>{

}
