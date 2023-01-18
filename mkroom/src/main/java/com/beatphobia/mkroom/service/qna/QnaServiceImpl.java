package com.beatphobia.mkroom.service.qna;
  
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.paging.QnaPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaDTO;
import com.beatphobia.mkroom.mapper.QnaAttachFileMapper;
import com.beatphobia.mkroom.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor

public class QnaServiceImpl implements QnaService{
  
	private QnaMapper qnaMapper;	
	private QnaAttachFileMapper qnaAttachFileMapper;
	
	//QnA 게시물 목록 조회 서비스 1
	@Override
	public List<QnaDTO> getQnaList(QnaPagingDTO qnaPagingDTO) {

		return qnaMapper.selectQnaList(qnaPagingDTO);
	}
  
	//QnA 게시물 총 개수 조회 서비스 - 페이징 시 필요
	@Override
	public long getRowAmountTotal(QnaPagingDTO qnaPagingDTO) {
		log.info("QnaService.getRowAmountTotal()에 전달된 QnaPagingDTO: " + qnaPagingDTO);
		return qnaMapper.selectRowAmountTotal(qnaPagingDTO);
	}
  
	//QnA 테이블의 마지막 bno 조회
	@Override
	public long getLastBno() {
		return qnaAttachFileMapper.selectLastBno();
	}
  
	//QnA 게시물 등록
	@Transactional
	@Override 
	public long registerQna(QnaDTO qnaDTO) { 
	
		qnaMapper.insertQna(qnaDTO) ;
    
		return qnaDTO.getBno();
   }
  
	//QnA 게시물 첨부파일 등록
	@Transactional
	@Override 
	public void registerAttachFile(FileInfoDTO fileInfoDTO, QnaDTO qnaDTO) {
		//첨부파일이 없는 경우, 메서드 종료
		if (fileInfoDTO == null) {
			//첨부파일이 없을 때 내용 등록만하고 bno 반환, 메서드 종료. 
			return ;
		}
		
			qnaAttachFileMapper.insertAttachFile(fileInfoDTO);
			qnaAttachFileMapper.insertAttachFiletag(fileInfoDTO, qnaDTO);
	
	}
  
  
	//특정 QnA 게시물 조회(조회수 증가 고려)
	@Override
	public QnaDTO getQna(long bno) {
		qnaMapper.updateBviewsCnt(bno); 
		return qnaMapper.selectQna(bno) ; 
  }
	//특정 QnA 게시물 수정페이지 이동
	@Override
	public QnaDTO getQnaDetailModify(long bno) {
	log.info("QnaService.getBoard()에 전달된 bno: " + bno);
	return qnaMapper.selectQna(bno);
   }
  
	//특정 QnA 게시물 수정
	@Transactional
	@Override
	public boolean modifyQna(QnaDTO qnaDTO) { 
	
		boolean qnaModfyResult = (qnaMapper.updateQna(qnaDTO) == 1) ;		
		
		
//		if ( (qnaModfyResult && qnaDTO.getAttachFileList() != null)) {
//			qnaAttachFileMapper.deleteQnaAllAttachFiles(bno);
//			qnaDTO.getAttachFileList().forEach(
//					
//					attachFile -> {
//						qnaAttachFileMapper.insertAttachFile(attachFile) ;
//						qnaAttachFileMapper.insertAttachFiletag(attachFile, qnaDTO);
//						
//					}
//			);	
//			
//		}
	  
		return qnaModfyResult ;
    
	}
  
	//특정 QnA 게시물 삭제 - 실제 삭제
	@Transactional
	@Override
	public boolean removeQna(long bno) {
	
	qnaAttachFileMapper.deleteQnaAllAttachFiles(bno);
		
	return qnaMapper.deleteQna(bno) == 1; }

	//특정 QnA 게시물 삭제요청
	@Override
	public boolean setQnaDeleted(long bno) {
		
	return qnaMapper.updateBdelFlag(bno) == 1;
	}
	
    //삭제할 게시물 조회
	@Override
    public List<QnaDTO> selectBdelFlagOn(PagingDTO pagingDTO){
    	
    	return qnaMapper.selectBdelFlagOn(pagingDTO);
    }
    
    //삭제할 게시물 총 갯수 조회
	@Override
    public long selectBdelFlagOnRowAmountTotal() {
    	return qnaMapper.selectBdelFlagOnRowAmountTotal();
    }
	
	
	//파일 있는 Bno값 불러오기
	@Override
	public List<FileInfoDTO> getQnaAttachFileList(long bno) {


		return qnaAttachFileMapper.findByBno(bno);
	}

	//파일 정보 LIST
	@Override
	public List<FileInfoDTO> getAttachFiles(long bno) {
		return qnaAttachFileMapper.selectQnaAttachFileList(bno);
	}

	
	//DB에 저장된 파일 전부 조회 - qnaDTO로 받기
	@Override
	public QnaDTO selectQnaAllFile(long bno){
		return qnaAttachFileMapper.selectQnaAllFile(bno);
	}
	
	
	@Override
	public void deleteQnaAllAttachFiles(long bno) {
		
		qnaAttachFileMapper.deleteQnaAllAttachFiles(bno);
		
	}


  }
 