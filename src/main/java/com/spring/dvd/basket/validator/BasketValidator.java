package com.spring.dvd.basket.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.spring.dvd.generic.validator.GenericValidator;

@Component
public class BasketValidator implements GenericValidator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
	}
	
}
