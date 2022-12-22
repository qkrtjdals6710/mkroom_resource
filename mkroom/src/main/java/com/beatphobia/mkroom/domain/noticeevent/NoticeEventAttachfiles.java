package com.beatphobia.mkroom.domain.noticeevent;

import lombok.ToString;

@ToString
public class NoticeEventAttachfiles {

//	UUID VARCHAR2 (100 BYTE)
//	BNO NUMBER (10)
	
	private String uuid;
	private long bno;
	
	
	public NoticeEventAttachfiles() {

	}
	
	
	public NoticeEventAttachfiles(String uuid, long bno) {
		this.uuid = uuid;
		this.bno = bno;
	}
	
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public long getBno() {
		return bno;
	}
	public void setBno(long bno) {
		this.bno = bno;
	}



	
	

}
