package com.beatphobia.mkroom.service.eventboard;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.paging.EventReplyPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.EventReplyPagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventReplyDTO;
import com.beatphobia.mkroom.mapper.EventBoardMapper;
import com.beatphobia.mkroom.mapper.EventReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EventReplyServiceImpl implements EventReplyService{
	private EventReplyMapper EventReplyMapper;
	private EventBoardMapper EventBoardMapper;
	
	@Override
	public EventReplyPagingCreatorDTO getEventReplyList(EventReplyPagingDTO eventReplyPagingDTO) {
		long replyTotalCnt=EventReplyMapper.selectEventReplyTotalCnt(eventReplyPagingDTO);
		int pageNum=eventReplyPagingDTO.getPageNum();
		EventReplyPagingCreatorDTO EventReplyPagingCreatorDTO=null;
		if(replyTotalCnt==0) {
			eventReplyPagingDTO.setPageNum(1);
			EventReplyPagingCreatorDTO=new EventReplyPagingCreatorDTO(0, eventReplyPagingDTO, EventReplyMapper.selectEventReplyList(eventReplyPagingDTO));
		}else {
			if(pageNum==-10) {
				pageNum=(int)Math.ceil(replyTotalCnt/(eventReplyPagingDTO.getRowAmountPerPage()*1.0));
				eventReplyPagingDTO.setPageNum(pageNum);
			}
			EventReplyPagingCreatorDTO=new EventReplyPagingCreatorDTO(EventReplyMapper.selectEventReplyTotalCnt(eventReplyPagingDTO), eventReplyPagingDTO, EventReplyMapper.selectEventReplyList(eventReplyPagingDTO));
		}
		return EventReplyPagingCreatorDTO;
	}
	@Override
	@Transactional
	public long registerEventReplyForBoard(NoticeEventReplyDTO noticeEventReplyDTO) {
		EventReplyMapper.insertEventReplyForBoard(noticeEventReplyDTO);
		EventBoardMapper.updateBReplyCnt(noticeEventReplyDTO.getBno(),1);
		return noticeEventReplyDTO.getRno();
	}
	@Override
	@Transactional
	public long registerEventReplyForReply(NoticeEventReplyDTO noticeEventReplyDTO) {
		EventReplyMapper.insertEventReplyForReply(noticeEventReplyDTO);
		EventBoardMapper.updateBReplyCnt(noticeEventReplyDTO.getBno(),1);
		return noticeEventReplyDTO.getBno();
	}
	@Override
	public NoticeEventReplyDTO getEventReply(long bno, long rno) {
		return EventReplyMapper.selectEventReplySearch(bno, rno);
	}
	@Override
	public int modifyEventReply(NoticeEventReplyDTO noticeEventReplyDTO) {
		return EventReplyMapper.updateEventReply(noticeEventReplyDTO);
	}
	@Override
	@Transactional
	public int removeEventReply(long bno, long rno) {
		int delRowCnt=EventReplyMapper.deleteEvenetReply(bno, rno);
		EventBoardMapper.updateBReplyCnt(bno,-1);
		return delRowCnt;
	}
}
