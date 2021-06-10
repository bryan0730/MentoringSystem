package com.hustar.mentoring.enterprise.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.enterprise.domain.EnterpriseSearchDomain;

@Mapper
public interface EnterpriseMapper {

	public List<EnterpriseDomain> selectEnterpriseList();

	public List<EnterpriseDomain> scrollDownPost(int startSeq);

	public List<EnterpriseDomain> selectEnterSearchList(@Param("search") EnterpriseSearchDomain enterpriseSearchDomain);

	public EnterpriseDomain selectEnterDetail(String enterpriseSeq); 

}
