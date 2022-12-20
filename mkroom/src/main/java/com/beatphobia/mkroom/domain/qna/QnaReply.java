package com.beatphobia.mkroom.domain.qna;

import java.sql.Timestamp;
import java.util.Date;

import lombok.ToString;

@ToString
public class QnaReply {

//	RNO NUMBER (10)
//	BNO NUMBER (10)
//	RCONTENT VARCHAR2 (4000 BYTE)
//	RWRITER VARCHAR2 (100 BYTE)
//	RREGDATE DATE
//	RMODDATE TIMESTAMP (0)
//	REPLYORNOT NUMBER (1)
//	PRNO NUMBER (20)
	
	private int rno;
	private int bno;
	private String rcontent;
	private String rwriter;
	private Date rregDate;
	private Timestamp rmodDate;
	private int replyOrNot;
	private int prno;
	
	public QnaReply() {
		
	}
	
	public QnaReply(int rno, int bno, String rcontent, String rwriter, Date rregDate, Timestamp rmodDate,
			int replyOrNot, int prno) {
		this.rno = rno;
		this.bno = bno;
		this.rcontent = rcontent;
		this.rwriter = rwriter;
		this.rregDate = rregDate;
		this.rmodDate = rmodDate;
		this.replyOrNot = replyOrNot;
		this.prno = prno;
	}

	
	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
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

	public Date getRregDate() {
		return rregDate;
	}

	public void setRregDate(Date rregDate) {
		this.rregDate = rregDate;
	}

	public Timestamp getRmodDate() {
		return rmodDate;
	}

	public void setRmodDate(Timestamp rmodDate) {
		this.rmodDate = rmodDate;
	}

	public int getReplyOrNot() {
		return replyOrNot;
	}

	public void setReplyOrNot(int replyOrNot) {
		this.replyOrNot = replyOrNot;
	}

	public int getPrno() {
		return prno;
	}

	public void setPrno(int prno) {
		this.prno = prno;
	}



	

}
