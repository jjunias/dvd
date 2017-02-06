package com.spring.dvd.generic.common;

import com.spring.dvd.generic.dto.GenericDto;

public abstract class Search<T extends GenericDto> {
	
	public T Search(T dto){
		String keyword = dto.getKeyword();
		String condition = dto.getCondition();
		if("title".equals(condition)){
			dto.setTitle(keyword);
		}
		return dto;
	}
}
