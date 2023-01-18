package com.beatphobia.mkroom.service.eventboard;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.fileupload.BoardFileInfoDTO;
import com.beatphobia.mkroom.common.paging.EventBoardPagingDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventDTO;
import com.beatphobia.mkroom.mapper.EventBoardAttachMapper;
import com.beatphobia.mkroom.mapper.EventBoardMapper;

@Service
public class EventBoardServiceImpl implements EventBoardService {
	
	//매퍼 인터페이스 주입
	private EventBoardMapper eventBoardMapper ;
	private EventBoardAttachMapper eventBoardAttachMapper;
	
	public EventBoardServiceImpl(EventBoardMapper eventBoardMapper,
								 EventBoardAttachMapper eventBoardAttachMapper) {
		this.eventBoardMapper = eventBoardMapper;
		this.eventBoardAttachMapper = eventBoardAttachMapper;
	}
	
	
	//게시물 목록 조회
	@Override
	public List<NoticeEventDTO> getBoardList(EventBoardPagingDTO eventBoardPagingDTO) {
		//System.out.println("서비스 getBoardList 실행");
		
		
		return eventBoardMapper.selectEventBoardList(eventBoardPagingDTO);
	}
		
	
	//게시물 총 갯수 구하기(검색, 원하는 것만 보여주기 반영)
	@Override
	public long getRowAmountTotal(EventBoardPagingDTO eventBoardPagingDTO) {
		//System.out.println("서비스 getRowAmountTotal 실행");
		
		return eventBoardMapper.selectRowAmountTotal(eventBoardPagingDTO) ;
	}
	
	//특정 게시물 조회(조회수증가 1) - 조회수 증가와 조회가 같이 일어나야 함. 
	@Transactional
	@Override
	public NoticeEventDTO getBoard(long bno) {	
		
		//조회수 1증가
		eventBoardMapper.updateBviewsCnt(bno);
		return eventBoardMapper.selectEventBoard(bno);
		
	}
	
	//전체 게시물의 첨부파일 조회 
	@Override
	public List<NoticeEventDTO> getAllBoardFile() {
		return eventBoardAttachMapper.selectBoardAllAttachFileList();
	}
	
	//특정 게시물의 첨부파일 조회
	@Transactional
	@Override
	public NoticeEventDTO getBoardFile(long bno) {
		//System.out.println("서비스 getBoardFile 실행");
		return eventBoardAttachMapper.selectBoardAttachFileList(bno);
	}
	
	
	//특정 게시물 조회 시, 게시물의 첨부파일 정보를 조회
	@Override
	public NoticeEventDTO getAttachFiles(long bno) {
		//System.out.println("서비스 getAttachFiles 실행");
		//System.out.println("eventBoardAttachMapper.selectBoardAttachFileList(bno): " + eventBoardAttachMapper.selectBoardAttachFileList(bno));
		return eventBoardAttachMapper.selectBoardAttachFileList(bno) ;
	}
	
    //게시물 마지막 bno 얻기
	@Override
    public long getFilnalBno() {
		//System.out.println("서비스 getFilnalBno 실행");
		
    	return eventBoardMapper.selectLastBno();
    }
	
    //게시물 등록
	@Override
    public long registerBoard(NoticeEventDTO noticeEventDTO) {
		//System.out.println("서비스 registerBoard 실행");
		//System.out.println("noticeEventDTO: " + noticeEventDTO);
		
    	eventBoardMapper.insertEventBoard(noticeEventDTO);
		return noticeEventDTO.getBno();
    }
    
	//게시물 파일 등록(혹시 필요할까 해서 long으로 처리함. 0이면 첨부파일 없음, 1이면 첨부파일 있음)
    //두 번의 DB 변화가 동시에 진행되어야 함. 
	@Transactional
	@Override
	public long registerFile(BoardFileInfoDTO fileInfo, NoticeEventDTO noticeEventDTO) {
		//System.out.println("서비스 registerFile 실행");
		
		//첨부파일이 없는 경우, 메서드 종료
		if (fileInfo == null) {
			//첨부파일이 없을 때 내용 등록만하고 bno 반환, 메서드 종료. 
			return 0;
		}
		
		//첨부파일이 있을 경우, 첨부파일 등록 후 bno 반환, 메서드 종료
		eventBoardAttachMapper.insertAttachFile(fileInfo);
		eventBoardAttachMapper.insertAttachtag(noticeEventDTO, fileInfo);
		
		return 1;
	}
	
	//해당 bno에 대한 게시물 정보를 주는 메서드. 조회수 변동 없음. 
	@Transactional
	@Override
	public NoticeEventDTO getBoardDetailModify(long bno) {
		//System.out.println("서비스 getBoardDetailModify 실행");
		return eventBoardMapper.selectEventBoard(bno) ;
	}
	
	//게시물 수정 - DB 접근이 모두 동시에 진행되어야 한다. 
	@Transactional
	@Override
	public boolean modifyBoard(NoticeEventDTO noticeEventDTO) {
		
		//업데이트가 되면, 1을 반환하므로 true가 저장됨. 
		boolean boardModfyResult = (eventBoardMapper.updateEventBoard(noticeEventDTO) == 1) ;
		
		NoticeEventDTO uploadFiles = eventBoardAttachMapper.selectBoardAttachFileList(noticeEventDTO.getBno());
		//하고 싶은 것 - DB에서 가져온 파일에서, 화면에서 넘어온 파일 , beforeFileCheck 값이 "b"인 값을 제거하는 것. 
		//Stream을 만들고 제거한 값을 넣는다. 
		
		List<BoardFileInfoDTO> fileinfoList = new ArrayList<BoardFileInfoDTO>();
		List<BoardFileInfoDTO> getFileInfosssss = noticeEventDTO.getFileInfos();
		List<BoardFileInfoDTO> getWFileInfosssss = noticeEventDTO.getWfileInfos();

		if(uploadFiles == null) {
			
			if(noticeEventDTO.getWfileInfos() != null) {
				
				for(BoardFileInfoDTO boardFileInfoDTO : getFileInfosssss){
					eventBoardAttachMapper.insertAttachFile(boardFileInfoDTO); 
					eventBoardAttachMapper.insertAttachtag(noticeEventDTO, boardFileInfoDTO) ; 
				}
				
				for(BoardFileInfoDTO wboardFileInfoDTO : getWFileInfosssss){
				
				    if(wboardFileInfoDTO != null) {//새로운 파일 - 기존 파일 전부 삭제 후 업로드 
						
						fileinfoList.add(wboardFileInfoDTO);
					}
				}
			} else {
				
				for(BoardFileInfoDTO boardFileInfoDTO : getFileInfosssss){
					eventBoardAttachMapper.insertAttachFile(boardFileInfoDTO); 
					eventBoardAttachMapper.insertAttachtag(noticeEventDTO, boardFileInfoDTO) ; 
				}
				
				if(getWFileInfosssss != null) {
					
					for(BoardFileInfoDTO wboardFileInfoDTO : getWFileInfosssss){
						
					    if(wboardFileInfoDTO != null) {//새로운 파일 - 기존 파일 전부 삭제 후 업로드 
							
							fileinfoList.add(wboardFileInfoDTO);
						}
					}
					
				} 
			}
			
			removeAttachFiles(fileinfoList);
			return false;
		}
		
		List<BoardFileInfoDTO> fileinfoPara = uploadFiles.getFileInfos();
		
		eventBoardAttachMapper.deleteBoardAllAttachFiles(noticeEventDTO.getBno());
		if ( noticeEventDTO.getFileInfos() != null) {
			for(BoardFileInfoDTO boardFileInfoDTO : getFileInfosssss){
				
				//기존 파일 처리 - 업로드 파일에서는 삭제하지 말고 업뎃
				if(boardFileInfoDTO.getBeforeFileCheck().equals("b")) {
					
					fileinfoPara = fileinfoPara.stream().filter(fileinfo -> !boardFileInfoDTO.getUuid().equals(fileinfo.getUuid())).collect(Collectors.toList());
					
					eventBoardAttachMapper.insertAttachFile(boardFileInfoDTO); 
					eventBoardAttachMapper.insertAttachtag(noticeEventDTO, boardFileInfoDTO) ; 
				} else {
					eventBoardAttachMapper.insertAttachFile(boardFileInfoDTO); 
					eventBoardAttachMapper.insertAttachtag(noticeEventDTO, boardFileInfoDTO) ; 
				}
				
			}
			fileinfoList = fileinfoPara;
		} else {
			fileinfoList = uploadFiles.getFileInfos();
		}
			
		if(noticeEventDTO.getWfileInfos() != null) {
			for(BoardFileInfoDTO wboardFileInfoDTO : getWFileInfosssss){
			
			    if(wboardFileInfoDTO != null) {//새로운 파일 - 기존 파일 전부 삭제 후 업로드 
					
					fileinfoList.add(wboardFileInfoDTO);
					
				}
			
			}
		}
		
		
		
		removeAttachFiles(fileinfoList);
			
		return boardModfyResult;
	}//modifyBoard end
	
	
	//게시물 수정 - DB 접근이 모두 동시에 진행되어야 한다. 
	@Transactional
	@Override
	public void modifyCancelBoard(NoticeEventDTO noticeEventDTO) {
		
		NoticeEventDTO uploadFiles = eventBoardAttachMapper.selectBoardAttachFileList(noticeEventDTO.getBno());
			
		//하고 싶은 것 - DB에서 가져온 파일에서, 화면에서 넘어온 파일 , beforeFileCheck 값이 "b"인 값을 제거하는 것. 
		//Stream을 만들고 제거한 값을 넣는다. 
		
		List<BoardFileInfoDTO> fileinfoList = new ArrayList<BoardFileInfoDTO>();
		List<BoardFileInfoDTO> getFileInfosssss = noticeEventDTO.getFileInfos();
		List<BoardFileInfoDTO> getWFileInfosssss = noticeEventDTO.getWfileInfos();

		if(uploadFiles == null) {
			
			if(noticeEventDTO.getWfileInfos() != null) {
				
				for(BoardFileInfoDTO boardFileInfoDTO : getFileInfosssss){
					fileinfoList.add(boardFileInfoDTO);
				}	
				
				for(BoardFileInfoDTO wboardFileInfoDTO : getWFileInfosssss){

					
				    if(wboardFileInfoDTO != null) {//새로운 파일 - 기존 파일 전부 삭제 후 업로드 
						
						fileinfoList.add(wboardFileInfoDTO);
					}
				}
			}
			
			removeAttachFiles(fileinfoList);
			return;
		}
		
		List<BoardFileInfoDTO> fileinfoPara = uploadFiles.getFileInfos();
		
		if ( noticeEventDTO.getFileInfos() != null) {
			for(BoardFileInfoDTO boardFileInfoDTO : getFileInfosssss){
				
				//기존 파일 처리 - 업로드 파일에서는 삭제하지 말고 업뎃
				if(boardFileInfoDTO.getBeforeFileCheck().equals("b")) {
					
					fileinfoPara = fileinfoPara.stream().filter(fileinfo -> !boardFileInfoDTO.getUuid().equals(fileinfo.getUuid())).collect(Collectors.toList());
					
				} else {
					fileinfoPara.add(boardFileInfoDTO);
				}
			}
			fileinfoList = fileinfoPara;
		}	
		
		if(noticeEventDTO.getWfileInfos() != null) {
			for(BoardFileInfoDTO wboardFileInfoDTO : getWFileInfosssss){
			
			    if(wboardFileInfoDTO != null) {//새로운 파일 - 기존 파일 전부 삭제 후 업로드 
					
					fileinfoList.add(wboardFileInfoDTO);
					
				}
			
			}
		}
		removeAttachFiles(fileinfoList);
			
	}//modifyBoard end
	
	//특정 게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정
	@Override
	public boolean setBoardDeleted(long bno) {
		
		return (eventBoardMapper.updateBdelFlag(bno) == 1);
	}
 
    
	@Override
	public void deleteBoardAllAttachFiles(long bno) {
		
		eventBoardAttachMapper.deleteBoardAllAttachFiles(bno);
		
	}
	
    //삭제할 게시물 조회
	@Override
    public List<NoticeEventDTO> selectBdelFlagOn(PagingDTO pagingDTO){
    	return eventBoardMapper.selectBdelFlagOn(pagingDTO);
    	
    }
	
    //삭제할 게시물 총 갯수 조회
	@Override
    public long selectBdelFlagOnRowAmountTotal() {
    	return eventBoardMapper.selectBdelFlagOnRowAmountTotal();
    }
	
	
	
	   //업로드 파일 List 삭제 내부 메서드 
	   private void removeAttachFiles(List<BoardFileInfoDTO> FileInfoDTOList) {
		   
	      if (FileInfoDTOList == null) {
	         return;
	      }
	      
	      FileInfoDTOList.forEach(fileInfo -> {
	    	  
			      Path file =  Paths.get("C:/myupload/" + fileInfo.getUploadPath() + "/" + fileInfo.getUuid()+ "_" + fileInfo.getFileName());
			      try {
			         Files.deleteIfExists(file); 

			         if (Files.probeContentType(file).startsWith("image")) {
			            Path thumbnail = Paths.get("C:/myupload/" + fileInfo.getUploadPath() + "/s_" + fileInfo.getUuid()+ "_" + fileInfo.getFileName());
			            Files.delete(thumbnail);
			         }

			      } catch (Exception e) {
			         System.out.println("오류: " + e.getMessage());
			      }

	    	  });
	   }

	   
	   //업로드 파일 삭제 내부 메서드 
	   public void removeAttachFile(BoardFileInfoDTO boardFileInfoDTO) {
		   
	      
	       if (boardFileInfoDTO == null) {
	          return;
	       }

	      Path file =  Paths.get("C:/myupload/" + boardFileInfoDTO.getUploadPath() + "/" + boardFileInfoDTO.getUuid()+ "_" + boardFileInfoDTO.getFileName());
	      try {
	         Files.deleteIfExists(file); 

	         if (Files.probeContentType(file).startsWith("image")) {
	            Path thumbnail = Paths.get("C:/myupload/" + boardFileInfoDTO.getUploadPath() + "/s_" + boardFileInfoDTO.getUuid()+ "_" + boardFileInfoDTO.getFileName());
	            Files.delete(thumbnail);
	         }

	      } catch (Exception e) {
	         System.out.println("오류: " + e.getMessage());
	      }
	
	  }
	   
	   
	   
	   
	   
	   
	   
}
