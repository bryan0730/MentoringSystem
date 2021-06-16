package com.hustar.mentoring.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

public interface AdminService {

	public List<EnterpriseDomain> selectEnterpriseList();

	public void updateEnterprise(EnterpriseDomain enterpriseDomain, MultipartFile uploadFile) throws Exception;

	public void deleteEnterprise(EnterpriseDomain enterpriseDomain);

	public void insertEnterprise(EnterpriseDomain enterpriseDomain, MultipartFile uploadFile);


}
