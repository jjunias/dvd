package com.spring.dvd.generic.validator;



import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public interface GenericValidator extends Validator {
	public boolean supports(Class<?> clazz);

	public void validate(Object target, Errors errors);

}
