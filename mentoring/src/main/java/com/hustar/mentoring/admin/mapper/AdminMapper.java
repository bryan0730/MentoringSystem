package com.hustar.mentoring.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hustar.mentoring.enterprise.domain.EnterpriseDomain;
import com.hustar.mentoring.login.domain.MemberDomain;

@Mapper
public interface AdminMapper {

	public List<EnterpriseDomain> selectEnterpriseList();

	public void updateEnterprise(EnterpriseDomain enterpriseDomain, @Param("fileName")String fileName);

	public void deleteEnterprise(EnterpriseDomain enterpriseDomain);

	public void insertEnterprise(EnterpriseDomain enterpriseDomain, @Param("fileName")String fileName);

	public List<MemberDomain> selectMentoList();
	
	public List<MemberDomain> selectMentiList();
	
	public void insertMentoring(int mentoSeq, List<String> mentiSeq);
	
	public void updateMentoring(int mentoSeq, int mentiSeq);
	
	public void deleteMentoring(int mentiSeq);
	
	public List<MemberDomain> selectMentiListOfMento(int mentoSeq);
}
