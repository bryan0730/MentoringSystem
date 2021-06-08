package com.hustar.mentoring.board.config;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.domain.BoardDomain;
import com.hustar.mentoring.board.domain.FileDomain;


public class BoardFileUtils {
	
	// 파일 업로드
		public static String fileUpload(String uploadPath, String fileName, byte[] fileData) throws Exception {
			
			// 파일명이 중복됐을 때 덮어써지거나 이름이 바뀌는 것을 방지하기 위해 UUID를 통해 랜덤 문자를 생성해서 파일명에 붙여준다.
			UUID uid = UUID.randomUUID();
			
			String newFileName = uid + "_" + fileName;
			
			// 해당 이미지를 복사해서 지정된 경로에 저장한다.
			File img = new File(uploadPath, newFileName);
			FileCopyUtils.copy(fileData, img);
			
			return newFileName;
		}
		
		// 파일 업로드
		public static List<FileDomain> FileUpload (BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
			// 파일이 없으면 null 반환
			if(ObjectUtils.isEmpty(multipartHttpServletRequest)) {
				return null;
			}
			
			// return을 위한 FileDomain list를 생성
			List<FileDomain> filelist = new ArrayList<>();
			
			// 파일명이 중복됐을 때 덮어써지거나 이름이 바뀌는 것을 방지하기 위해 UUID를 통해 랜덤 문자를 생성
			UUID uid = UUID.randomUUID();
			
			// 경로 지정
			String Path = "C:\\Users\\HUSTAR03\\Desktop\\hustar\\MentoringBoardFiles";
			File file = new File(Path);
			
			// 해당 경로에 폴더가 없으면 폴더 생성
			if (file.exists() == false) {
				file.mkdirs();
			}
			
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			String newFileName;
			
			while (iterator.hasNext()) {
				
				// MultipartHttpServletRequest에 저장된 파일 이름을 통해 파일 정보를 저장
				List<MultipartFile> fileList = multipartHttpServletRequest.getFiles(iterator.next());
				
				for (MultipartFile multipartFile : fileList) {
					if (multipartFile.isEmpty() == false) {
						
						
						newFileName = uid + "_" + multipartFile.getOriginalFilename();
						
						
						// 비어있으면 탈출
						if (ObjectUtils.isEmpty(multipartFile.getContentType())) {
							break;
						}
						
						FileDomain fileDomain = new FileDomain();
						
						// 파일 정보를 Domain에 set
						fileDomain.setBoardSeq(boardDomain.getBoardSeq()); // 어느 게시글의 파일인지 명시
						fileDomain.setFileOriginName(multipartFile.getOriginalFilename());
						fileDomain.setFileContentType(multipartFile.getContentType());
						fileDomain.setFileSize(multipartFile.getSize());
						fileDomain.setFilePath(Path + File.separator + newFileName);
						
						filelist.add(fileDomain);
						
						file = new File(Path + File.separator + newFileName);
						
						multipartFile.transferTo(file);
					}
					
				}
			}
			
			return filelist;
		}

}
