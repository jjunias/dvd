package com.spring.dvd.basket.dto;

import com.spring.dvd.generic.dto.GenericDto;

public class BasketDto extends GenericDto{
	private String id;
	private int num;
	
	public BasketDto(){}

	public BasketDto(String id, int num) {
		super();
		this.id = id;
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}
