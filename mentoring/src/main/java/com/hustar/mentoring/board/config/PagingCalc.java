package com.hustar.mentoring.board.config;

import com.hustar.mentoring.board.domain.BoardDomain;

public class PagingCalc {
	
	// 현재 페이지
	private int pageIndex = 1;
	
	// 페이지 개수 (한 번에 몇개까지 보여줄건지)
	private int pageUnit=10;
	
	// 페이지 사이즈 (페이징을 몇개까지 보여줄건지)
	private int pageSize=10;
		
	// 게시글 총 개수
	private int TotalCnt;
	
	// 하단 페이징 번호
	private int pagingNum;
	
	// 출력되는 첫번째 페이징 번호
	private int startPageNum;
	
	// 출력되는 마지막 페이징 번호
	private int endPageNum;
	
	
	public int getStartPageNum() {
		return startPageNum;
	}


	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}


	public int getEndPageNum() {
		return endPageNum;
	}


	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}


	public void setPagingNum(int pagingNum) {
		this.pagingNum = pagingNum;
	}



	// 이전, 다음 표시 여부
	private boolean prev;
	private boolean next;
	
	
	public int getTotalCnt() {
		return TotalCnt;
	}


	public void setTotalCnt(int totalCnt, BoardDomain boardDomain) throws Exception {
		TotalCnt = totalCnt;
		PageCalc(boardDomain);
	}


	public int getPagingNum() {
		return pagingNum;
	}


	public boolean isPrev() {
		return prev;
	}



	public boolean isNext() {
		return next;
	}



	// Domain에 존재하는 정보 : 현재 Index, pageUnit, firstpage, lastpage
	public void PageCalc(BoardDomain boardDomain) throws Exception {
		
		// 게시글 전체 개수 호출
		
		// 표시되는 마지막 번호 계산
		endPageNum = (int)(Math.ceil((double)boardDomain.getPageIndex() / (double)boardDomain.getPageUnit()) * boardDomain.getPageUnit());
		System.out.println(endPageNum);
		// 표시되는 첫번재 번호 계산
		startPageNum = endPageNum - (boardDomain.getPageUnit()-1);
		System.out.println(startPageNum);
		
		
		// 게시글 마지막 페이징 번호 계산
		int lastPaging = (int)(Math.ceil((double)TotalCnt / (double)boardDomain.getPageUnit()));
		
		// 표시되는 마지막 번호가 계산한 마지막 페이징보다 크면 마지막 페이징으로 입력
		if (endPageNum > lastPaging) {
			endPageNum = lastPaging;
		}
		
		
		prev = startPageNum == 1? false : true;
		System.out.println(prev);
		next = endPageNum * boardDomain.getPageUnit() >= TotalCnt ? false : true;
		
		boardDomain.setFirstpage((boardDomain.getPageIndex() - 1) * boardDomain.getPageSize());
	}
}
