package com.beatphobia.mkroom.common.paging;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class QnaPagingDTO {

	private int pageNum;
	private int rowAmountPerPage;
	private String scope;
	private String keyword;

	public String[] getScopeArray() {
		return this.scope == null ? new String[] {} : this.scope.split("");
	}

	public String addPagingParamsToURI() {

		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum).queryParam("rowAmountPerPage", this.rowAmountPerPage)
				.queryParam("scope", this.scope).queryParam("keyword", this.keyword);

		String uriString = uriComponentsBuilder.toUriString();
		return uriString;

	}

	public QnaPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}

	public QnaPagingDTO(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;

		} else {
			this.pageNum = pageNum;
		}

		this.rowAmountPerPage = 10;
	}

	public QnaPagingDTO(int pageNum, int rowAmountPerPage) {
		if (pageNum <= 0) {
			this.pageNum = 1;

		} else {

			this.pageNum = pageNum;
		}

		if (rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 10;

		} else {

			this.rowAmountPerPage = rowAmountPerPage;
		}

	}

}
