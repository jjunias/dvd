package com.spring.dvd.basket.dto;

public class BasketDto{
	private int basket_num;
	private String id;
	private int dvd_num;
	private int count;
	private int buy;
	private String regdate;
	public BasketDto(){}
	
	public BasketDto(int basket_num, String id, int dvd_num, int count, int buy, String regdate) {
		super();
		this.basket_num = basket_num;
		this.id = id;
		this.dvd_num = dvd_num;
		this.count = count;
		this.buy = buy;
		this.regdate = regdate;
	}
	
	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getBuy() {
		return buy;
	}

	public void setBuy(int buy) {
		this.buy = buy;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
