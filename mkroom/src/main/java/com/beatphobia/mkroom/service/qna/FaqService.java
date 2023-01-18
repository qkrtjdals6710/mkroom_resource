package com.beatphobia.mkroom.service.qna;
  
import java.util.List;

import com.beatphobia.mkroom.domain.qna.FaqDTO;
  
public interface FaqService {
 
	//FAQ게시물 조회 - 목록
	public List<FaqDTO> getFaqList();
  
	//FAQ게시물 등록 
	public long registerFaq(FaqDTO faqDTO);
  
	//FAQ게시물 테이블의 마지막 bno 조회
	public long getLastfaq();

  
	//특정 FAQ게시물 조회
	public FaqDTO getFaq(long bno);

	//FAQ게시물 게시물 조회 페이지 -> 게시물 수정 페이지 호출
	public FaqDTO getFaqDetailModify(long bno);
       
	//특정 FAQ게시물 수정 
	public boolean modifyFaq(FaqDTO faqDTO);
  
	//특정 FAQ게시물 삭제 - 실제 삭제 
	public boolean removeFaq(long bno);
  
	//특정 FAQ게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정 
	public boolean setFaqDeleted(long bno);


  
  }
 