package com.spring.dvd.rating.dto;

public class RatingRecommendDto {
	private int rating_num;
	private String userId;
	private int count;
	
	public RatingRecommendDto(){}

	public RatingRecommendDto(int rating_num, String userId, int count) {
		super();
		this.rating_num = rating_num;
		this.userId = userId;
		this.count = count;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
