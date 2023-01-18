package com.beatphobia.mkroom.domain.noticeevent;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.beatphobia.mkroom.common.fileupload.BoardFileInfoDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class NoticeEventDTO {

	//게시판
	private long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date bregDate;
	private Timestamp bmodDate;
	private long bviewCnt;
	private long breplyCnt;
	private long bdelFlag;
	
	//private List<NoticeEventAttachfiles> eventAttachfiles ;
	private List<BoardFileInfoDTO> fileInfos;
	private List<BoardFileInfoDTO> wfileInfos;
}
