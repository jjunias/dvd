package com.spring.dvd.movie.dto;

import com.spring.dvd.generic.dto.GenericDto;

public class DvdDto extends GenericDto{
	
	private int num; //상품 번호
	private String national; //국적
	private String genre; //장르
	private String title; //제목
    private String actor; //출연 배우
    private String content; //내용
    private String production; //제작 년도
    private int price; // 가격
    private String trailer; //동영상 링크
    private float grade; //평점
    private int views; //조회수
    private String regdate; //등록 일자
    
    private int dvd_num; //dvd num 사용
    private int count;
    private int basket_num;
    public DvdDto(){}//defalut 생성자

	public DvdDto(int num, String national, String genre, String title, String actor, String content, String production,
			int price, String trailer, float grade, int views, String regdate,int dvd_num, int count, int basket_num) {
		this.num = num;
		this.national = national;
		this.genre = genre;
		this.title = title;
		this.actor = actor;
		this.content = content;
		this.production = production;
		this.price = price;
		this.trailer = trailer;
		this.grade = grade;
		this.views = views;
		this.regdate = regdate;
		this.dvd_num = dvd_num;
		this.count = count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProduction() {
		return production;
	}

	public void setProduction(String production) {
		this.production = production;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}
	
}
