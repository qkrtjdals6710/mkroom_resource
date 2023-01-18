package com.beatphobia.mkroom.service.qna;
  
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.domain.qna.FaqDTO;
import com.beatphobia.mkroom.mapper.FaqMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor

public class FaqServiceImpl implements FaqService{
  
	private FaqMapper faqMapper;

	
	//게시물 목록 조회 서비스1
	@Override
	public List<FaqDTO> getFaqList() {
	
		return faqMapper.selectFaqList();
	}
	  
	//게시물 등록
	@Transactional
	@Override 
	public long registerFaq(FaqDTO faqDTO) { 
		
		faqMapper.insertFaq(faqDTO) ;
	    
		return faqDTO.getBno();
	}
	  
	  
	//faq 테이블의 마지막 bno 조회
	@Override
	public long getLastfaq() {
		  
		return faqMapper.selectLastFaq();
	}

	//특정 게시물 조회
	@Override
	public FaqDTO getFaq(long bno) {
			
		return faqMapper.selectFaq(bno) ; 
	}
  	
	//게시물 수정 처리
	@Override
	public boolean modifyFaq(FaqDTO faqDTO) {

		boolean faqModfyResult = (faqMapper.updateFaq(faqDTO) == 1) ;	
  		  
		return faqModfyResult;
		
	  }
	  
	//게시물 삭제 - 실제 삭제 발생
	@Override
	public boolean removeFaq(long bno) {
		
		return faqMapper.deleteFaq(bno)==1;
	}
		
	//게시물 삭제 - bdelFlag 컬럼만 1로 수정
	@Override
	public boolean setFaqDeleted(long bno) {
		
		return faqMapper.updateBdelFlagFaq(bno)==1;
	}
	
	//조회 - 수정 페이지 넘어감
	@Override
	public FaqDTO getFaqDetailModify(long bno) {
		return faqMapper.selectFaq(bno) ;
	}



}



	



	

  
  
 