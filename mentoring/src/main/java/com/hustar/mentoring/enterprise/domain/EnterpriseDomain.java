package com.hustar.mentoring.enterprise.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class EnterpriseDomain {

	@Getter @Setter
	private int enterpriseSeq;
	
	@Getter @Setter
	private String enterpriseBusinessNumber;
	
	@Getter @Setter
	private String enterpriseName;
	
	@Getter @Setter
	private String enterpriseOperator;
	
	@Getter @Setter
	private String enterpriseLogo;
	
	@Getter @Setter
	private String enterpriseEmployees;
	
	@Getter @Setter
	private String enterpriseUrl;
	
	@Getter @Setter
	private String enterpriseWoringHours;
	
	private String enterpriseTask;
	
	@Getter @Setter
	private String enterpriseNumber;
	
	@Getter @Setter
	private String enterpriseSales;
	
	@Getter @Setter
	private String enterpriseProfit;
	
	@Getter @Setter
	private String enterpriseSalary;
	
	@Getter @Setter
	private String enterpriseAvgSalary;
	
	@Getter @Setter
	private String enterpriseWelfare;
	
	@Getter @Setter
	private String enterpriseVision1;
	
	@Getter @Setter
	private String enterpriseVision2;
	
	@Getter @Setter
	private String enterpriseVision3;
	
	@Getter @Setter
	private String enterpriseVision4;
	
	@Getter @Setter
	private String enterpriseDiscription;
	
	@Getter @Setter
	private String enterpriseRegion;
	
	@Getter @Setter
	private String enterpriseMessage;

	@Getter @Setter
	private List<String> enterpriseTaskList;
	
	
	public String getEnterpriseTask() {
		return enterpriseTask;
	}

	public void setEnterpriseTask(String enterpriseTask) {
		
		this.enterpriseTask = enterpriseTask;
	}
}
