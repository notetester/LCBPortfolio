package com.lcb404.utill;

import lombok.Data;

@Data
public class PageVO {
	//criteria를 받아서 화면에 보여줄 버튼을 계산할 클래스
	
	private int startPage; //첫페이지번호
	private int endPage; //마지막페이지 번호
	private boolean prev; //이전버튼 활성화
	private boolean next; //다음버튼 활성화
	
//	private Criteria cri;
	private int total;
	private int pageNum;
	private int amount;
	
	//반드시 cri와 total을 넘겨받도록 기본생성자를 만들지 않음
	public PageVO(Criteria cri, int total) {
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
//		this.cri = cri;
		
		//끝페이지 계산
		//PageNum이 11을 가리킬때 => 20번이 되야한다.
		
		//계산식 = (int)Math.ceil(조회하는 페이지 번호 / (double)한번에 보여질 페이지 수) * 한번에 보여질 페이지수
		this.endPage = (int)Math.ceil( this.pageNum / 5.0 ) * 5;
		
		//계산식 = 끝 페이지 번호 - 한번에 보여질  페이지번호 + 1
		this.startPage = endPage - 5+1;
		
		//계산식 = (int)Math.ceil(전체 게시글수 / 몇개의 데이터를 보여줄지)
		int realEnd = (int)Math.ceil(this.total / (double)this.amount );
		
		//마지막 페이지세팅에서 보여줘야하는 번호
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//startPage가 1보다 크면 true
		this.prev = startPage > 1;
		
		//realEnd가 endPage보다 크다면 true;
		this.next = realEnd > this.endPage;
	}	
}
