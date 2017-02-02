package com.spring.dvd.test;

import org.springframework.stereotype.Service;

import com.spring.dvd.generic.service.GenericServiceImpl;

@Service
public class testService extends GenericServiceImpl<testDto, String, testDao> {

}
