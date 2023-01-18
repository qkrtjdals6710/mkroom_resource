package com.beatphobia.mkroom.domain.noticeevent;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class NoticeEventReplyDTO {

	private long rno;
	private long bno;
	private String rcontent;
	private String rwriter;
	private String rregDate;
	private String rmodDate;
	private long prno;
	private int lvl;
	
}
