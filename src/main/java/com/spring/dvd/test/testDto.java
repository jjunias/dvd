package com.spring.dvd.test;

import com.spring.dvd.generic.dto.GenericDto;

public class testDto extends GenericDto {
	int num;
	String name;
 
	public testDto() {
	}

	public testDto(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
