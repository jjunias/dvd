package com.spring.dvd.qna.dto;

public class QnaDto {
	private int qna_num;
	private String qna_writer;
	private String qna_title;
	private String qna_content;
	private String regdate;
	private String qna_answer;
	private int dvd_num;
	
	public QnaDto(){}
	
	public QnaDto(int qna_num, String qna_writer, String qna_title, String qna_content, String regdate,
			String qna_answer, int dvd_num) {
		super();
		this.qna_num = qna_num;
		this.qna_writer = qna_writer;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.regdate = regdate;
		this.qna_answer = qna_answer;
		this.dvd_num = dvd_num;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public int getDvd_num() {
		return dvd_num;
	}

	public void setDvd_num(int dvd_num) {
		this.dvd_num = dvd_num;
	}
}
