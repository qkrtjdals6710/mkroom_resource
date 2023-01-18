package com.beatphobia.mkroom.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QuestPagingCreatorDTO {

	private QuestPagingDTO questPagingDTO; //사용자 입력과 설정에 따라 만들어진 페이지 번호와 행 갯수를 가진 객체. 
	private int startPagingNum;  // 보고 있는 화면에 표시될 시작 페이징 번호(1, 11, ...)
	private int endPagingNum; // 보고 있는 화면에 표시될 끝 페이징 번호(10, 20, ...)
	private boolean prev; // 이전 버튼 표시 여부를 결정하는 변수
	private boolean next; // 다음 버튼 표시 여부를 결정하는 변수
	private long rowAmountTotal; // 조회한 자료의 전체 행 갯수
	private int pagingNumCnt; // 화면 하단에 표시할 총 페이지 번호의 수
	private int lastPageNum; // 조회한 자료에 대한 마지막 페이지 번호
	
	public QuestPagingCreatorDTO(long rowAmountTotal, QuestPagingDTO questPagingDTO) {
		
		this.questPagingDTO = questPagingDTO; // 사용자 입력과 설정에 따라 만들어진 페이지 번호와 행 갯수를 갖게 함.
		this.rowAmountTotal = rowAmountTotal; // 조회한 자료의 계산된 총 행의 수 
		this.pagingNumCnt = 5; // 하단에 표시할 총 페이지 번호 수 지정 
		
		//끝 페이징 번호 계산: ([입력된 페이지 번호 수(1 ~ 5라면 5 취급이 되도록) / 표시할 번호 갯수(5)]올림) * 표시할 번호 갯수(5) 
		this.endPagingNum = (int) (Math.ceil(questPagingDTO.getPageNum() / (this.pagingNumCnt * 1.0))) * this.pagingNumCnt;
		
		//시작 페이징 번호 계산: (끝 페이징 번호에서 표시할 페이징 갯수 빼고 1더하기) <== 오류가 있다고? 
		//this.startPagingNum = this.endPagingNum - this.pagingNumCnt + 1;
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
		
		//실제 마지막 페이지 번호: (전체 행의 수 / 페이지 당 표시할 행의 수) 올림
		this.lastPageNum = (int) (Math.ceil((rowAmountTotal * 1.0) / questPagingDTO.getRowAmountPerPage()));
		
		//계산된 끝 페이징 번호(실제로 행이 존재하든 하지 않든 계산되는 값임)가 실제 마지막 페이지 번호(실제로 행이 들어있는 값까지.)보다 크면 대체. 
		if(this.lastPageNum < this.endPagingNum) {
			this.endPagingNum = this.lastPageNum;
		}
		
		//이전 버튼 표시 여부: 화면에 보이는 시작 페이징 번호가 1보다 크면 표시. 
		this.prev = (this.startPagingNum > 1);
		
		//다음 버튼 표시 여부: 화면에 보이는 끝 페이징 번호가 마지막 페이징 번호보다 작으면 표시. 
		this.next = (this.endPagingNum <this.lastPageNum);
		
	}
	
	
}
