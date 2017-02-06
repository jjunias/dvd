package com.spring.dvd.generic.dao;

import java.util.List;
	//제네릭 타입을 사용하면 요청 클래스에 따라 타입이 바뀜
    //GenericDao<T  = Dto 타입을 정의 , K getData를 할때 파라메터 타입 ex) int num , String num 
public interface GenericDao<T,K> {
	
	public int insert(T dto);
	public List<T> getList();
	public T getData(K data);
	public int update(T dto);
	public int delete(K data);
	public int getCount();
}
