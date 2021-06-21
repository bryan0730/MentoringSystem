package com.hustar.mentoring.mypage.config;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.login.domain.MemberDomain;

public class ProfilImg {
	
	public static MemberDomain UploadProfil (MultipartHttpServletRequest multipartHttpServletRequest, MemberDomain memberdomain, String Photo) throws Exception {
	
					
		// 파일명이 중복됐을 때 덮어써지거나 이름이 바뀌는 것을 방지하기 위해 UUID를 통해 랜덤 문자를 생성
		UUID uid = UUID.randomUUID();
		
		String root = multipartHttpServletRequest.getSession().getServletContext().getRealPath("/");
		//로컬에서 실행시 경로
		//String Path = root.substring(0,root.length()-7).concat("resources" + File.separator + "static" + File.separator + "ProfilImg");
		
		//서버에서 실행시 경로
		String Path = root.concat("WEB-INF" + File.separator + "classes" + File.separator +"static" + File.separator + "ProfilImg");
		
		
		File file = new File(Path);
		// 만약 경로에 폴더가 없으면 생성
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		String newFileName;
		
		//MemberDomain memberDomain = new MemberDomain();
		
			
			// MultipartHttpServletRequest에 저장된 파일 이름을 통해 파일 정보를 저장
			MultipartFile fileList = multipartHttpServletRequest.getFile("file");
			
				if (fileList.isEmpty() == false) {
					
					
					newFileName = uid + "_" + fileList.getOriginalFilename();
					
					

					// 파일 정보를 Domain에 set
					memberdomain.setMemberPhoto("/ProfilImg/" + newFileName);
					
					file = new File(Path + File.separator + newFileName);
					
					FileCopyUtils.copy(fileList.getBytes(), file);
					
				} else {
					
					memberdomain.setMemberPhoto(Photo);
				}
				

		return memberdomain;
	}
}
