package com.spring.dvd.movie.dto;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dvd.generic.dto.GenericDto;

public class DvdDto extends GenericDto {

	private int num; //상품 번호
	private String national; //국적
	private String genre; //장르
	private String title; //제목
    private String actor; //출연 배우
    private String content; //내용
    private String production; //제작 년도
    private int price; // 가격
    private float grade; //평점
    private int views; //조회수
    private String regdate; //등록 일자
    //파일 업로드
    private MultipartFile myFile;
  	private String orgFileName;
  	private String saveFileName;	//파일 시스템에 저장된 파일명
  	private long fileSize;			//파일의 크기 byte
    
    public DvdDto(){}//defalut 생성자

	public DvdDto(int num, String national, String genre, String title, String actor, String content, String production,
			int price, float grade, int views, String regdate, MultipartFile myFile, String orgFileName,
			String saveFileName, long fileSize) {
		this.num = num;
		this.national = national;
		this.genre = genre;
		this.title = title;
		this.actor = actor;
		this.content = content;
		this.production = production;
		this.price = price;
		this.grade = grade;
		this.views = views;
		this.regdate = regdate;
		this.myFile = myFile;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
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

	public MultipartFile getMyFile() {
		return myFile;
	}

	public void setMyFile(MultipartFile myFile) {
		this.myFile = myFile;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}
