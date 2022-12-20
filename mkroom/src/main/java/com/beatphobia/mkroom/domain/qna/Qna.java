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
	
	private int bno;
	private String btitle;
	private String bwriter;
	private Date bregDate;
	private int bviewCnt;
	private int breplyCnt;
	private int bdelFlag;
	
	public Qna() {
		
	}

	public Qna(int bno, String btitle, String bwriter, Date bregDate, int bviewCnt, int breplyCnt, int bdelFlag) {
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bregDate = bregDate;
		this.bviewCnt = bviewCnt;
		this.breplyCnt = breplyCnt;
		this.bdelFlag = bdelFlag;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
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

	public int getBviewCnt() {
		return bviewCnt;
	}

	public void setBviewCnt(int bviewCnt) {
		this.bviewCnt = bviewCnt;
	}

	public int getBreplyCnt() {
		return breplyCnt;
	}

	public void setBreplyCnt(int breplyCnt) {
		this.breplyCnt = breplyCnt;
	}

	public int getBdelFlag() {
		return bdelFlag;
	}

	public void setBdelFlag(int bdelFlag) {
		this.bdelFlag = bdelFlag;
	}
	
	
	
	
	
}
