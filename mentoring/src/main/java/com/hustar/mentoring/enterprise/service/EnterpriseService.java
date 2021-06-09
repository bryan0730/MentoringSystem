package com.hustar.mentoring.enterprise.service;

import java.util.List;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

public interface EnterpriseService {

	public List<EnterpriseDomain> selectEnterpriseList();

	public List<EnterpriseDomain> scrollDownPost(int startSeq);

}
