package com.hustar.mentoring.enterprise.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnterpriseSearchDomain {
	
	private String location;
	private String searchText;
	private List<String> locationList;
}
