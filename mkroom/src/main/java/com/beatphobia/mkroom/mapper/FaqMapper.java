package com.beatphobia.mkroom.mapper;

import java.util.List;

import com.beatphobia.mkroom.domain.qna.FaqDTO;

public interface FaqMapper {

	//FAQ게시물 조회 - 목록
  	public List<FaqDTO> selectFaqList();

	//FAQ게시물 총 개수 조회
  	//public long selectRowAmountTotal() ;
	
  	//특정 FAQ게시물 조회 
	public FaqDTO selectFaq(long bno);

	//FAQ 테이블의 마지막 bno 조회
	public long selectLastFaq();
  	
    //FAQ게시물 등록 
    public int insertFaq(FaqDTO faqDTO);

    //특정 FAQ게시물 수정
    public int updateFaq(FaqDTO faqDTO);
    
    //특정 FAQ게시물 삭제 - 실제 삭제 
    public int deleteFaq(long bno);

    //특정 FAQ게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정 
    public int updateBdelFlagFaq(long bno);



	
}
