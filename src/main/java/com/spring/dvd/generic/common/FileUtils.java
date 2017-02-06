package com.spring.dvd.generic.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dvd.generic.dto.GenericDto;

public abstract class FileUtils<T extends GenericDto> {

	public T Files(HttpServletRequest request, T dto) {

		String realPath = request.getSession().getServletContext().getRealPath("/upload");

		// MultipartFile 객체의 참조값 얻어오기
		// FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile = dto.getMyFile();
		
		
		// 원본 파일명
		String orgFileName = mFile.getOriginalFilename();
		if(!"".equals(orgFileName)){	
			// 파일 사이즈
			long fileSize = mFile.getSize();
			// 저장할 파일의 상세 경로
			String filePath = realPath + File.separator;
			// 디렉토리를 만들 파일 객체 생성
			File file = new File(filePath);
			if (!file.exists()) {// 디렉토리가 존재하지 않는다면
				file.mkdir();// 디렉토리를 만든다.
			}
			// 파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			String saveFileName = System.currentTimeMillis() + orgFileName;
			try {
				// upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			// FileDto 객체에 추가 정보를 담는다.
			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
			dto.setFileSize(fileSize);
		}
		return dto;

	}
}
