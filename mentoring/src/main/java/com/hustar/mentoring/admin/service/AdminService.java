package com.hustar.mentoring.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.login.domain.MemberDomain;

public interface AdminService {

	public List<EnterpriseDomain> selectEnterpriseList();

	public void updateEnterprise(EnterpriseDomain enterpriseDomain, MultipartFile uploadFile) throws Exception;

	public void deleteEnterprise(EnterpriseDomain enterpriseDomain);

	public void insertEnterprise(EnterpriseDomain enterpriseDomain, MultipartFile uploadFile);

	public List<MemberDomain> selectMentoList();
	
	public List<MemberDomain> selectMentiList();
	
	public void insertMentoring(int mentoSeq, List<String> mentiSeq);

	public void deleteMentoring(int mentiSeq);
	
	public List<MemberDomain> selectMentiListOfMento(int mentoSeq);
}
