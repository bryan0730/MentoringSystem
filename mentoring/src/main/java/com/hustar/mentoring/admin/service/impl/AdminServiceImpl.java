package com.hustar.mentoring.admin.service.impl;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.admin.mapper.AdminMapper;
import com.hustar.mentoring.admin.service.AdminService;
import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

	private final AdminMapper adminMapper;
	private final ServletContext sc;

	@Override
	public List<EnterpriseDomain> selectEnterpriseList() {
		// TODO Auto-generated method stub
		return adminMapper.selectEnterpriseList();
	}

	@Override
	public void updateEnterprise(EnterpriseDomain enterpriseDomain, MultipartFile uploadFile) throws Exception {
		// TODO Auto-generated method stub
		
		String root = sc.getRealPath("/");
		String Path = root.substring(0,root.length()-7).concat("resources/static/enterprise/img/");
		
		File file = new File(Path+uploadFile.getOriginalFilename());
		
		try {
			InputStream io = uploadFile.getInputStream();
			FileUtils.copyInputStreamToFile(io, file);
		}catch (Exception e) {
			// TODO: handle exception
			FileUtils.deleteQuietly(file);
			e.printStackTrace();
		}
		
		//adminMapper.updateEnterprise(enterpriseDomain);
	}

	@Override
	public void deleteEnterprise(EnterpriseDomain enterpriseDomain) {
		// TODO Auto-generated method stub
		adminMapper.deleteEnterprise(enterpriseDomain);
	}
}
