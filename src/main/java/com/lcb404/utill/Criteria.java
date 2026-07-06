package com.lcb404.utill;

import lombok.Data;

@Data
public class Criteria {	
	private int pageNum;
	private int amount;
	
	//검색에 필요한 데이터 변수의 선언	
	private String searchKey;
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}	
}
