package com.beatphobia.mkroom.domain.qna;



import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

  public class QnaReplyDTO {
	  
	
  // RNO NUMBER (10) 
  // BNO NUMBER (10) 
  // RCONTENT VARCHAR2 (4000 BYTE) 
  // RWRITER VARCHAR2 (100 BYTE) 
  // RREGDATE DATE 
  // RMODDATE TIMESTAMP (0) 
  // REPLYORNOT NUMBER (1) 
  // PRNO NUMBER (20)
  
  private long rno; 
  private long bno; 
  private String rcontent; 
  private String rwriter; 
  private Timestamp rregDate; 
  private Timestamp rmodDate; 
  private int replyOrNot; 
  private long prno;
  private int lvl;
  
  public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

  
}