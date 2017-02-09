package com.spring.dvd.rating.dto;

import com.spring.dvd.generic.dto.GenericDto;

public class RatingDto extends GenericDto{
	private int num;
	private String writer;
	private String title;
	private float score;
	private String content;
	private int dvd_num;
	private int recommend;
	private String regdate;
	
	public RatingDto(){}

	public RatingDto(int num, String writer, String title, float score, String content, int dvd_num, int recommend,
			String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.score = score;
		this.content = content;
		this.dvd_num = dvd_num;
		this.recommend = recommend;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "RatingDto [num=" + num + ", writer=" + writer + ", title=" + title + ", score=" + score + ", content="
				+ content + ", dvd_num=" + dvd_num + ", recommend=" + recommend + ", regdate=" + regdate + "]";
	}
	
}
