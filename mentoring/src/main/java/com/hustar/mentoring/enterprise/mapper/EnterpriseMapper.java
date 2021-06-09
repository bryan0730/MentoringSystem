package com.hustar.mentoring.enterprise.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;

@Mapper
public interface EnterpriseMapper {

	public List<EnterpriseDomain> selectEnterpriseList();

	public List<EnterpriseDomain> scrollDownPost(int startSeq);

}
