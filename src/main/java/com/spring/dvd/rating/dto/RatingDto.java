package com.spring.dvd.rating.dto;

import com.spring.dvd.generic.dto.GenericDto;

public class RatingDto extends GenericDto{
	private int num;
	private String writer;
	private float score;
	private String content;
	private int dvd_num;
	private String regdate;
	
	public RatingDto(){}

	public RatingDto(int num, String writer, float score, String content, int dvd_num, String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.score = score;
		this.content = content;
		this.dvd_num = dvd_num;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDvd_num() {
		return dvd_num;
	}

	public void setDvd_num(int dvd_num) {
		this.dvd_num = dvd_num;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
