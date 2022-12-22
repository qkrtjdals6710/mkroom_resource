package com.beatphobia.mkroom.domain.noticeevent;

import java.sql.Timestamp;
import java.util.Date;

import lombok.ToString;

@ToString
public class NoticeEvent {

//	BNO NUMBER (10)
//	BTITLE VARCHAR2 (200 BYTE)
//	BCONTENT VARCHAR2 (4000 BYTE)
//	BWRITER VARCHAR2 (100 BYTE)
//	BREGDATE DATE
//	BMODDATE TIMESTAMP (0)
//	BVIEWCNT NUMBER (20)
//	BREPLYCNT NUMBER (20)
//	BDELFLAG NUMBER (1)

	private long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date bregDate;
	private Timestamp bmodDate;
	private long bviewCnt;
	private long breplyCnt;
	private long bdelFlag;
	
	public NoticeEvent() {
		
	} 
	
	
	public NoticeEvent(long bno, String btitle, String bcontent, String bwriter, Date bregDate, Timestamp bmodDate,
			long bviewCnt, long breplyCnt, long bdelFlag) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bregDate = bregDate;
		this.bmodDate = bmodDate;
		this.bviewCnt = bviewCnt;
		this.breplyCnt = breplyCnt;
		this.bdelFlag = bdelFlag;
	}


	public long getBno() {
		return bno;
	}


	public void setBno(long bno) {
		this.bno = bno;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public String getBwriter() {
		return bwriter;
	}


	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}


	public Date getBregDate() {
		return bregDate;
	}


	public void setBregDate(Date bregDate) {
		this.bregDate = bregDate;
	}


	public Timestamp getBmodDate() {
		return bmodDate;
	}


	public void setBmodDate(Timestamp bmodDate) {
		this.bmodDate = bmodDate;
	}


	public long getBviewCnt() {
		return bviewCnt;
	}


	public void setBviewCnt(long bviewCnt) {
		this.bviewCnt = bviewCnt;
	}


	public long getBreplyCnt() {
		return breplyCnt;
	}


	public void setBreplyCnt(long breplyCnt) {
		this.breplyCnt = breplyCnt;
	}


	public long getBdelFlag() {
		return bdelFlag;
	}


	public void setBdelFlag(long bdelFlag) {
		this.bdelFlag = bdelFlag;
	}



	
	
}
