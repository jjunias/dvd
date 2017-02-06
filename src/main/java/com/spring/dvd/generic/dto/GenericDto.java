package com.spring.dvd.generic.dto;

import org.springframework.web.multipart.MultipartFile;

public class GenericDto {

	private MultipartFile myFile;
  	private String orgFileName;
  	private String saveFileName;	//파일 시스템에 저장된 파일명
  	private long fileSize;			//파일의 크기 byte
  	
  	private int pageNum;
	private int startRowNum;
	private int endRowNum;           //페이지 네이션
	private int totalPageCount;
	
	private String keyword;	 	// 검색
	private String title;
	private String condition;
	
	public GenericDto(){}

	public GenericDto(MultipartFile myFile, String orgFileName, String saveFileName, long fileSize, int pageNum,
			int startRowNum, int endRowNum, int totalPageCount, String keyword, String title, String condition) {
		super();
		this.myFile = myFile;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.pageNum = pageNum;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.totalPageCount = totalPageCount;
		this.keyword = keyword;
		this.title = title;
		this.condition = condition;
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

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
}
