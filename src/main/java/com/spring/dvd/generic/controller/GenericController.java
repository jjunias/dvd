package com.spring.dvd.generic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dvd.generic.dao.GenericDao;
import com.spring.dvd.generic.service.GenericService;
import com.spring.dvd.generic.validator.GenericValidator;

public abstract class GenericController<T, K, D extends GenericDao<T, K>, S extends GenericService<T, K, D>, V extends GenericValidator> {
   @Autowired
   S service;
   @Autowired
   V validator;

   // 페이지 이동하는 요청에대한 맵핑
   @RequestMapping(value = "/**/", params = "type=views")
   public void MoveForm() {
   }
}