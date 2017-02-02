package com.spring.dvd.users.dto;

import com.spring.dvd.generic.dto.GenericDto;

public class UsersDto extends GenericDto{
	//  이름 , 생년월일 , 아이디 , 비밀번호 , 이메일 앞부분, 이메일 뒷부분 , 질문-답변(비밀번호 찾기)
	String userName;
	int userBirth;
	String userId;
	String userPwd;
	String userEmailId;
	String userEmail;
	String userQuestion;
	String userAnswer;
	
	public UsersDto(){}

	public UsersDto(String userName, int userBirth, String userId, String userPwd, String userEmailId, String userEmail,
			String userQuestion, String userAnswer) {
		super();
		this.userName = userName;
		this.userBirth = userBirth;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmailId = userEmailId;
		this.userEmail = userEmail;
		this.userQuestion = userQuestion;
		this.userAnswer = userAnswer;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserEmailId() {
		return userEmailId;
	}

	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserQuestion() {
		return userQuestion;
	}

	public void setUserQuestion(String userQuestion) {
		this.userQuestion = userQuestion;
	}

	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	
	
	
}
