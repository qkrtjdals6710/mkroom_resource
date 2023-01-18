package com.beatphobia.mkroom.common.paging;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class EventBoardPagingDTO {
	
	
	
	private int pageNum ; //페이지 수
	private int rowAmountPerPage ; //페이지당 보여줄 게시물 수
	private String scope ;
	private String keyword ;
	
	
	//검색범위 값 처리를 위한 메소드: 화면에서 선택된 TCW 값을 ["T", "C", "W"] 배열로 반환
	//이 메서드는 Mybatis 엔진에 의해서 자동으로 호출되어 사용됨(SQL 매퍼 파일의 SELECT문에서 설명함)
	public String[] getScopeArray() {
		return this.scope == null ? new String[] {} : this.scope.split("");
	}
	
	public String addPagingParamsToURI() {
		
		UriComponentsBuilder uriComponentsBuilder = 
				UriComponentsBuilder.fromPath("")
									.queryParam("pageNum", this.pageNum)
									.queryParam("rowAmountPerPage", this.rowAmountPerPage)
									.queryParam("scope", this.scope)
									.queryParam("keyword", this.keyword) ;
		
		String uriString = uriComponentsBuilder.toUriString() ;
		return uriString ;
		
	}
	
	
	public EventBoardPagingDTO() {
		this.pageNum = 1 ;			//페이지 1
		this.rowAmountPerPage = 6 ; //페이지당 글 6개
	}
	
	
	
	public EventBoardPagingDTO(int pageNum) {
		
		if(pageNum <= 0) {  	//페이지수가 0보다 작거나 같으면
			this.pageNum = 1 ;  //페이지수를 1로 지정
			
		} else {
			this.pageNum = pageNum ; //그 외에는 그대로 페이지수를 표시한다
		}
		
		this.rowAmountPerPage = 6 ; //페이지당 10개 표시
	}
	
	

	public EventBoardPagingDTO(int pageNum, int rowAmountPerPage) {
		if(pageNum <= 0) {
			this.pageNum = 1 ;
			
		} else {
		
			this.pageNum = pageNum ;
		}
		
		if(rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 6 ;
			
		} else {
		
			this.rowAmountPerPage = rowAmountPerPage ;
		}

	}
	
	

}