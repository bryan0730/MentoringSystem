package com.hustar.mentoring;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EchoMapper {

	public void echoInsert(EchoDomain echoDomain);

	public List<EchoDomain> selectEchoList(String memberId);
}
