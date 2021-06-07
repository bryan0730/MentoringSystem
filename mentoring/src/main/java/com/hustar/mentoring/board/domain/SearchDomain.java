package com.hustar.mentoring.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchDomain {
	// 검색 조건
	private String searchCondition = "";
	
	// 검색어
	private String searchKeyword = "";
	
	// 현재 페이지
	private int pageIndex = 1;
	
	// 페이지 개수 (한 번에 몇개까지 보여줄건지)
	private int pageUnit=10;
	
	// 페이지 사이즈 (페이징을 몇개까지 보여줄건지)
	private int pageSize=10;
	
	// 출력되는 첫번재 페이지
	private int firstpage = 1;

	

}
