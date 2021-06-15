package com.hustar.mentoring.admin.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hustar.mentoring.admin.mapper.AdminMapper;
import com.hustar.mentoring.admin.service.AdminService;
import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

	private final AdminMapper adminMapper;

	@Override
	public List<EnterpriseDomain> selectEnterpriseList() {
		// TODO Auto-generated method stub
		return adminMapper.selectEnterpriseList();
	}

	@Override
	public void updateEnterprise(EnterpriseDomain enterpriseDomain) {
		// TODO Auto-generated method stub
		adminMapper.updateEnterprise(enterpriseDomain);
	}

	@Override
	public void deleteEnterprise(EnterpriseDomain enterpriseDomain) {
		// TODO Auto-generated method stub
		adminMapper.deleteEnterprise(enterpriseDomain);
	}
}
