package com.beatphobia.mkroom.domain.qna;

import java.util.Date;

import lombok.ToString;

@ToString
public class Qna {

//	BNO NUMBER (10)
//	BTITLE VARCHAR2 (200 BYTE)
//	BCONTENT VARCHAR2 (4000 BYTE)
//	BWRITER VARCHAR2 (100 BYTE)
//	BREGDATE DATE
//	BVIEWCNT NUMBER (20)
//	BREPLYCNT NUMBER (20)
//	BDELFLAG NUMBER (1)
	
	private long bno;
	private String btitle;
	private String bwriter;
	private Date bregDate;
	private long bviewCnt;
	private long breplyCnt;
	private long bdelFlag;
	
	public Qna() {
		
	}

	public Qna(long bno, String btitle, String bwriter, Date bregDate, long bviewCnt, long breplyCnt, long bdelFlag) {
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bregDate = bregDate;
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
