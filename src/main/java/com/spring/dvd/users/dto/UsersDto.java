package com.spring.dvd.users.dto;

public class UsersDto{
	//  이름 , 아이디 , 비밀번호 , 이메일, 전화번호, 우편번호, 주소, 상세주소
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String phone;
	private String addrNum;
	private String addr;
	private String addrDetail;
	private String regdate;
	
	public UsersDto(){}

	public UsersDto(String name, String id, String pwd, String email, String phone, String addrNum, String addr,
			String addrDetail, String regdate) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.addrNum = addrNum;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(String addrNum) {
		this.addrNum = addrNum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
