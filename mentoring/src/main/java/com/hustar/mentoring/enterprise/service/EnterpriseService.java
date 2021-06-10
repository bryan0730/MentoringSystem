package com.hustar.mentoring.enterprise.service;

import java.util.List;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.enterprise.domain.EnterpriseSearchDomain;

public interface EnterpriseService {

	public List<EnterpriseDomain> selectEnterpriseList();

	public List<EnterpriseDomain> scrollDownPost(int startSeq);

	public List<EnterpriseDomain> selectEnterSearchList(EnterpriseSearchDomain enterpriseSearchDomain);

	public EnterpriseDomain selectEnterDetail(String enterpriseSeq);

}
