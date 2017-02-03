package com.spring.dvd.movie.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dvd.movie.dto.DvdDto;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

@Repository
public class DvdDaoImpl implements DvdDao{

	@Override
	public int insert(DvdDto dto) {
		// TODO Auto-generated method stub
		System.out.println("배우"+dto.getActor());
		System.out.println("내용"+dto.getContent());
		System.out.println("장르"+dto.getGenre());
		System.out.println("국적"+dto.getNational());
		System.out.println("오리진 이름"+dto.getOrgFileName());
		System.out.println("제작년도"+dto.getProduction());
		System.out.println("저장 이름"+dto.getSaveFileName());
		System.out.println("제목"+dto.getTitle());
		return 0;
	}

	@Override
	public List<DvdDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DvdDto getData(Integer data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(DvdDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Integer data) {
		// TODO Auto-generated method stub
		return 0;
	}

}
