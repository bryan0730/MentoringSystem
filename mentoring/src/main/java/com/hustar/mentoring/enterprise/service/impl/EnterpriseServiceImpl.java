package com.hustar.mentoring.enterprise.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.enterprise.domain.EnterpriseSearchDomain;
import com.hustar.mentoring.enterprise.mapper.EnterpriseMapper;
import com.hustar.mentoring.enterprise.service.EnterpriseService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EnterpriseServiceImpl implements EnterpriseService{

	private final EnterpriseMapper enterpriseMapper;
	
	@Override
	public List<EnterpriseDomain> selectEnterpriseList() {
		// TODO Auto-generated method stub
		return enterpriseMapper.selectEnterpriseList();
	}

	@Override
	public List<EnterpriseDomain> scrollDownPost(int startSeq) {
		// TODO Auto-generated method stub
		return enterpriseMapper.scrollDownPost(startSeq);
	}

	@Override
	public List<EnterpriseDomain> selectEnterSearchList(EnterpriseSearchDomain enterpriseSearchDomain) {
		// TODO Auto-generated method stub
		return enterpriseMapper.selectEnterSearchList(enterpriseSearchDomain);
	}

	@Override
	public EnterpriseDomain selectEnterDetail(String enterpriseSeq) {
		// TODO Auto-generated method stub
		return enterpriseMapper.selectEnterDetail(enterpriseSeq);
	}

}
