package com.beatphobia.mkroom.service.eventboard;

import com.beatphobia.mkroom.common.paging.EventReplyPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.EventReplyPagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventReplyDTO;

public interface EventReplyService {
	public EventReplyPagingCreatorDTO getEventReplyList(EventReplyPagingDTO eventReplyPagingDTO);
	public long registerEventReplyForBoard(NoticeEventReplyDTO noticeEventReplyDTO);
	public long registerEventReplyForReply(NoticeEventReplyDTO noticeEventReplyDTO);
	public NoticeEventReplyDTO getEventReply(long bno, long rno);
	public int modifyEventReply(NoticeEventReplyDTO noticeEventReplyDTO);
	public int removeEventReply(long bno, long rno);
}
