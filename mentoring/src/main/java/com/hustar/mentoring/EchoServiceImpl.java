package com.hustar.mentoring;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EchoServiceImpl implements EchoService{

	private final EchoMapper echoMapper;
	
	@Override
	public void echoInsert(EchoDomain echoDomain) {
		echoMapper.echoInsert(echoDomain);
	}

	@Override
	public List<EchoDomain> selectEchoList(String memberId) {
		// TODO Auto-generated method stub
		return echoMapper.selectEchoList(memberId);
	}

}
