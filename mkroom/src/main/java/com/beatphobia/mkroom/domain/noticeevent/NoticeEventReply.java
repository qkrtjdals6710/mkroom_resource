package com.beatphobia.mkroom.domain.noticeevent;

import lombok.ToString;

@ToString
public class NoticeEventReply {
//	RNO NUMBER (10)
//	BNO NUMBER (10)
//	RCONTENT VARCHAR2 (4000 BYTE)
//	RWRITER VARCHAR2 (100 BYTE)
//	RREGDATE DATE
//	RMODDATE TIMESTAMP (0)
//	PRNO NUMBER (10)

	private long rno;
	private long bno;
	private String rcontent;
	private String rwriter;
	private String rregDate;
	private String rmodDate;
	private long prno;
	
	
	public NoticeEventReply() {
		
	}

	
	

	public NoticeEventReply(long rno, long bno, String rcontent, String rwriter, String rregDate, String rmodDate,
			long prno) {
		this.rno = rno;
		this.bno = bno;
		this.rcontent = rcontent;
		this.rwriter = rwriter;
		this.rregDate = rregDate;
		this.rmodDate = rmodDate;
		this.prno = prno;
	}




	public long getRno() {
		return rno;
	}


	public void setRno(long rno) {
		this.rno = rno;
	}


	public long getBno() {
		return bno;
	}


	public void setBno(long bno) {
		this.bno = bno;
	}


	public String getRcontent() {
		return rcontent;
	}


	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}


	public String getRwriter() {
		return rwriter;
	}


	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}


	public String getRregDate() {
		return rregDate;
	}


	public void setRregDate(String rregDate) {
		this.rregDate = rregDate;
	}


	public String getRmodDate() {
		return rmodDate;
	}


	public void setRmodDate(String rmodDate) {
		this.rmodDate = rmodDate;
	}


	public long getPrno() {
		return prno;
	}


	public void setPrno(long prno) {
		this.prno = prno;
	}
	
	
}
