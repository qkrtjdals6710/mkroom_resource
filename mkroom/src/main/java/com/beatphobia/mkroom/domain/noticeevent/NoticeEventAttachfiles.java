package com.beatphobia.mkroom.domain.noticeevent;

import lombok.ToString;

@ToString
public class NoticeEventAttachfiles {

//	UUID VARCHAR2 (100 BYTE)
//	BNO NUMBER (10)
	
	private String uuid;
	private int bno;
	
	
	public NoticeEventAttachfiles() {

	}
	
	
	public NoticeEventAttachfiles(String uuid, int bno) {
		this.uuid = uuid;
		this.bno = bno;
	}
	
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}



	
	

}
