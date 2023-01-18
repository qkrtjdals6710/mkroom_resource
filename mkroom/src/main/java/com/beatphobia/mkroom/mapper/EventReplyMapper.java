package com.beatphobia.mkroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.EventReplyPagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventReplyDTO;

public interface EventReplyMapper {
 public List<NoticeEventReplyDTO> selectEventReplyList(EventReplyPagingDTO eventReplyPagingDTO);
 public long selectEventReplyTotalCnt(EventReplyPagingDTO eventReplyPagingDTO);
 public long insertEventReplyForBoard(NoticeEventReplyDTO noticeEventReplyDTO);
 public long insertEventReplyForReply(NoticeEventReplyDTO noticeEventReplyDTO);
 public NoticeEventReplyDTO selectEventReplySearch(@Param("bno") long bno, @Param("rno") long rno);
 public int updateEventReply(NoticeEventReplyDTO noticeEventReplyDTO);
 public int deleteEvenetReply(@Param("bno") long bno, @Param("rno") long rno);
}
