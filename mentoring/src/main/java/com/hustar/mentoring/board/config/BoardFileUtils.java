package com.hustar.mentoring.board.config;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.mentoring.board.domain.BoardDomain;


public class BoardFileUtils {
	
	// 파일 업로드
		public static String fileUpload(String uploadPath, String fileName, byte[] fileData) throws Exception {
			
			// 파일명이 중복됐을 때 덮어써지는 것을 방지하기 위해 UUID를 통해 랜덤 문자를 생성해서 파일명에 붙여준다.
			UUID uid = UUID.randomUUID();
			
			String newFileName = uid + "_" + fileName;
			
			// 해당 이미지를 복사해서 지정된 경로에 저장한다.
			File img = new File(uploadPath, newFileName);
			FileCopyUtils.copy(fileData, img);
			
			return newFileName;
		}
		
		// 파일 업로드
		public static void FileUpload (BoardDomain boardDomain, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
			if(ObjectUtils.isEmpty(multipartHttpServletRequest)) {
				return;
			}
			
			UUID uid = UUID.randomUUID();
			String Path = "C:\\Users\\HUSTAR03\\Desktop\\hustar\\MentoringBoardFiles";
			File file = new File(Path);
			if (file.exists() == false) {
				file.mkdirs();
			}
			
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			String newFileName;
			int cnt = 1;
			while (iterator.hasNext()) {
				
				// 저장된 파일 이름을 통해 파일 정보를 저장
				List<MultipartFile> fileList = multipartHttpServletRequest.getFiles(iterator.next());
				
				for (MultipartFile multipartFile : fileList) {
					if (multipartFile.isEmpty() == false) {
						
						
						newFileName = uid + "_" + multipartFile.getOriginalFilename();
						
						switch(cnt) {
						case 1:
							boardDomain.setBoardFilePath1(Path + File.separator + newFileName);
							cnt++;
							break;
						case 2:
							boardDomain.setBoardFilePath2(Path + File.separator + newFileName);
							cnt++;
							break;
						case 3:
							boardDomain.setBoardFilePath3(Path + File.separator + newFileName);
							cnt++;
							break;
						default :
							break;
						}
						
						file = new File(Path + File.separator + newFileName);
						multipartFile.transferTo(file);
					}
					
				}
			}
			
			return;
		}

}
