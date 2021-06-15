package com.hustar.mentoring.admin.service;

import java.util.List;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

public interface AdminService {

	public List<EnterpriseDomain> selectEnterpriseList();

	public void updateEnterprise(EnterpriseDomain enterpriseDomain);

	public void deleteEnterprise(EnterpriseDomain enterpriseDomain);

}
