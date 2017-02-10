package com.spring.dvd.basket.dto;

public class BasketDto{
	private String id;
	private int dvd_num;
	
	public BasketDto(){}

	public BasketDto(String id, int dvd_num) {
		super();
		this.id = id;
		this.dvd_num = dvd_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getDvd_num() {
		return dvd_num;
	}

	public void setDvd_num(int dvd_num) {
		this.dvd_num = dvd_num;
	}
	
	
}
