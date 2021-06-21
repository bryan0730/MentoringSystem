package com.hustar.mentoring;

import java.util.List;

public interface EchoService {

	public void echoInsert(EchoDomain echoDomain);

	public List<EchoDomain> selectEchoList(String memberId);
}
