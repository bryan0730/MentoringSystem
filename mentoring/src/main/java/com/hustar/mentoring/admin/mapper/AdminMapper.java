package com.hustar.mentoring.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

@Mapper
public interface AdminMapper {

	public List<EnterpriseDomain> selectEnterpriseList();

	public void updateEnterprise(EnterpriseDomain enterpriseDomain);

	public void deleteEnterprise(EnterpriseDomain enterpriseDomain);

}
