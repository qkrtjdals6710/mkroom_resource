package com.beatphobia.mkroom.domain.qna;

import lombok.ToString;

@ToString
public class QnaAttachfiles {

//	UUID VARCHAR2 (100 BYTE)
//	BNO NUMBER (10)
	
	private String uuid;
	private int bno;
	
	public QnaAttachfiles() {
		
	}

	public QnaAttachfiles(String uuid, int bno) {
		super();
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
