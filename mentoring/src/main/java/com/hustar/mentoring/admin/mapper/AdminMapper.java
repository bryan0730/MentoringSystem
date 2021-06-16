package com.hustar.mentoring.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

@Mapper
public interface AdminMapper {

	public List<EnterpriseDomain> selectEnterpriseList();

	public void updateEnterprise(EnterpriseDomain enterpriseDomain, @Param("fileName")String fileName);

	public void deleteEnterprise(EnterpriseDomain enterpriseDomain);

	public void insertEnterprise(EnterpriseDomain enterpriseDomain, @Param("fileName")String fileName);

}
