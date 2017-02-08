package com.spring.dvd.rating.dto;

public class RatingRecommendDto {
	private int rating_num;
	private String userId;
	
	public RatingRecommendDto(){}

	public RatingRecommendDto(int rating_num, String userId) {
		super();
		this.rating_num = rating_num;
		this.userId = userId;
	}

	public int getRating_num() {
		return rating_num;
	}

	public void setRating_num(int rating_num) {
		this.rating_num = rating_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
