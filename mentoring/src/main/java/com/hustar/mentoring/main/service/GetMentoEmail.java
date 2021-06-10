package com.hustar.mentoring.main.service;

import org.springframework.stereotype.Service;

import com.hustar.mentoring.main.mapper.MainMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GetMentoEmail {
	private final MainMapper mainMapper;
	
	public String findByEmail(int mentiSeq) {
		return mainMapper.findByEmail(mentiSeq);
	}

}
