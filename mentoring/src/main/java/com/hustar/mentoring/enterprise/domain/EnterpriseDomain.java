package com.hustar.mentoring.enterprise.domain;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnterpriseDomain {

	private int enterpriseSeq;
	private String enterpriseBusinessNumber;
	
	@NotBlank
	private String enterpriseName;
	private String enterpriseOperator;
	private String enterpriseLogo;
	private String enterpriseEmployees;
	private String enterpriseUrl;
	private String enterpriseWoringHours;
	private String enterpriseTask;
	private String enterpriseNumber;
	private String enterpriseSales;
	private String enterpriseProfit;
	private String enterpriseSalary;
	private String enterpriseAvgSalary;
	private String enterpriseWelfare;
	private String enterpriseVision1;
	private String enterpriseVision2;
	private String enterpriseVision3;
	private String enterpriseVision4;
	private String enterpriseDiscription;
	private String enterpriseRegion;
	private String enterpriseMessage;
	private List<String> enterpriseTaskList;
	
}
